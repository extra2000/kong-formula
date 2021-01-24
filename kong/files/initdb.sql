CREATE DATABASE {{ postgres.dbname }};
CREATE USER {{ postgres.user }} WITH PASSWORD '{{ postgres.password }}';
