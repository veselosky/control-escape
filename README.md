# Control-Escape

Control-Escape is an educational site that helps people take control of digital
technology to achieve their goals. This repository contains the software that produces
the site.

My Premise: Django is the best web framework for tiny teams building real products.

## PREP TASKS

- Import markdown content
- Create a data fixture for redirects from apache2_vhost

## Developing and Deploying with Docker

Infrastructure is mostly managed in Docker using Docker Compose. This is a lightweight
application so its resource requirements are not heavy.

Local development stack is defined in the `compose-local.yaml`.

- Cache: redis (shared; 6379)
- Celery Broker: redis (shared; 6379)
- Celery result backend: redis (shared; 6379)
- Database: SQLite on a shared volume (mapped to ./var/db/)
- Email: mailpit (SMTP:1025; web:8025)
- Media: Shared volume mapped to ./var/media/
- Static: Shared volume mapped to ./var/static/

Improvements to make for production deployment:

- A container running LiteStream replication service for SQLite, also mounting the DB
  volume.
- A container running Caddy to terminate SSL, serve media/static files, and load balance
  across containers.

When we need them, we'll add containers to run celery workers and celery beat, and maybe
flower to monitor celery.
