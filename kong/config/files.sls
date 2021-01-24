# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import KONG with context %}

/opt/kong:
  file.directory:
    - user: {{ KONG.hostuser.name }}
    - group: {{ KONG.hostuser.group }}

/home/{{ KONG.hostuser.name }}/.config/cni/net.d:
  file.directory:
    - user: {{ KONG.hostuser.name }}
    - group: {{ KONG.hostuser.group }}
    - makedirs: true

/home/{{ KONG.hostuser.name }}/.config/cni/net.d/podman-network-kongnet.conflist:
  file.managed:
    - source: salt://kong/files/podman-network-kongnet.conflist.jinja
    - user: {{ KONG.hostuser.name }}
    - group: {{ KONG.hostuser.group }}
    - template: jinja
    - context:
      pod: {{ KONG.pod }}

/opt/kong/kong-pod.yaml:
  file.managed:
    - source: salt://kong/files/kong-pod.yaml
    - user: {{ KONG.hostuser.name }}
    - group: {{ KONG.hostuser.group }}
    - template: jinja
    - context:
      image: {{ KONG.image }}
      resources: {{ KONG.resources }}
      port: {{ KONG.port }}

/opt/kong/postgres-pod.yaml:
  file.managed:
    - source: salt://kong/files/postgres-pod.yaml
    - user: {{ KONG.hostuser.name }}
    - group: {{ KONG.hostuser.group }}
    - template: jinja
    - context:
      postgres: {{ KONG.database.postgres }}

/opt/kong/kong.conf:
  file.managed:
    - source: salt://kong/files/kong.conf
    - user: {{ KONG.hostuser.name }}
    - group: {{ KONG.hostuser.group }}
    - template: jinja
    - context:
      domain_name: {{ KONG.pod.network.domain_name }}
      postgres: {{ KONG.database.postgres }}

/opt/kong/initdb.sql:
  file.managed:
    - source: salt://kong/files/initdb.sql
    - user: {{ KONG.hostuser.name }}
    - group: {{ KONG.hostuser.group }}
    - template: jinja
    - context:
      postgres: {{ KONG.database.postgres }}
