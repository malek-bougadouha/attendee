#!/usr/bin/env bash
# Web service start command for Railway (Django + gunicorn).
# Runs migrations + collectstatic on boot, then serves on Railway's $PORT.
set -euo pipefail

python manage.py migrate --noinput
python manage.py collectstatic --noinput

exec gunicorn attendee.wsgi \
  --bind "0.0.0.0:${PORT:-8000}" \
  --workers "${WEB_CONCURRENCY:-2}" \
  --timeout "${WEB_TIMEOUT:-120}"
