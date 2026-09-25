#!/bin/bash

set -e

echo "=== Fixing Apache MPM configuration ==="

a2dismod mpm_event 2>/dev/null || true
a2dismod mpm_worker 2>/dev/null || true
a2dismod mpm_prefork 2>/dev/null || true

a2enmod mpm_prefork

echo "=== Enabled MPM modules ==="
apache2ctl -M 2>&1 | grep mpm || true

echo "=== Starting Dolibarr ==="

exec apache2-foreground
