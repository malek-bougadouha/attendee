#!/usr/bin/env bash
# Worker service start command for Railway (Celery).
# This worker also RUNS the meeting bots in-process (LAUNCH_BOT_METHOD unset = celery mode),
# so it needs the same image (Chrome/ffmpeg/PulseAudio) — which the Dockerfile provides.
set -euo pipefail

exec celery -A attendee worker -l "${CELERY_LOG_LEVEL:-info}"
