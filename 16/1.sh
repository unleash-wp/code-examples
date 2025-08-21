# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

#!/bin/bash
set -e

# Clear cache
wp cache flush

# Optimize database
wp db optimize

# Delete expired transients
wp transient delete --all

# Run Wordfence security scan
wp wf scan run

# Send Slack notification
SITE_NAME=$(wp option get blogname)
curl -X POST -H 'Content-type: application/json' \
  --data "{\"text\":\"$SITE_NAME – Maintenance complete\"}" \
  https://hooks.slack.com/services/TOKEN