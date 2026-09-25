#!/bin/bash

set -e

echo "=== Railway Apache MPM fix ==="

a2dismod mpm_event 2>/dev/null || true
a2dismod mpm_worker 2>/dev/null || true

a2enmod mpm_prefork 2>/dev/null || true

echo "=== Apache MPM configuration ==="
apache2ctl -M 2>&1 | grep mpm || true

exec "$@"
