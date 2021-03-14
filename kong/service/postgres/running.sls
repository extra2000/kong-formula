# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import KONG with context %}

postgres-image-present:
  cmd.run:
    - name: podman pull {{ KONG.database.postgres.image.name }}
    - retry:
      - attempts: 10
      - interval: 5
      - until: true
    - runas: {{ KONG.hostuser.name }}

postgres-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - kong.service.postgres.destroy

postgres-pod-running:
  cmd.run:
    - name: podman play kube --network=kongnet postgres-pod.yaml
    - cwd: /opt/kong
    - runas: {{ KONG.hostuser.name }}
    - require:
      - cmd: postgres-image-present
      - module: postgres-pod-destroy-if-exists
