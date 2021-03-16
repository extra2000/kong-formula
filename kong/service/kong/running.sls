# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import KONG with context %}

kong-image-present:
  cmd.run:
    - name: podman pull {{ KONG.image.name }}
    - retry:
      - attempts: 10
      - interval: 5
      - until: true
    - runas: {{ KONG.hostuser.name }}

kong-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - kong.service.kong.destroy

kong-pod-running:
  cmd.run:
    {% if KONG.host_network %}
    - name: podman play kube kong-pod.yaml
    {% else %}
    - name: podman play kube --network=kongnet kong-pod.yaml
    {% endif %}
    - cwd: /opt/kong
    - runas: {{ KONG.hostuser.name }}
    - require:
      - cmd: kong-image-present
      - module: kong-pod-destroy-if-exists
