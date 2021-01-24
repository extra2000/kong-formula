# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import KONG with context %}

kong-container-dead:
  cmd.run:
    - name: podman pod rm --force kong-pod
    - runas: {{ KONG.hostuser.name }}
