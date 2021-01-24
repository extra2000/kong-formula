# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import KONG with context %}

kong-container-running:
  cmd.run:
    - name: podman play kube --network=kongnet kong-pod.yaml
    - cwd: /opt/kong
    - runas: {{ KONG.hostuser.name }}
