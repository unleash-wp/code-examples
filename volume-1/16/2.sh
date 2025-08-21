# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

#!/bin/bash
SITE_PATH="/var/www/html"
SITE_URL="https://example.com"
LOG_FILE="/var/log/wp-recovery.log"

# 1. Check WordPress status and HTTP response
if ! wp core is-installed --path="$SITE_PATH" >/dev/null 2>&1 || \
   [ "$(curl -s -o /dev/null -w "%{http_code}" $SITE_URL)" != "200" ]; then

  echo "$(date) - Error detected, starting recovery process" >> "$LOG_FILE"

  # 2. Countermeasures: restart services and clear cache
  systemctl restart php8.2-fpm
  systemctl restart nginx
  wp cache flush --path="$SITE_PATH"

  # 3. Rollback option: revert last Git commit and restore DB
  git reset --hard HEAD~1
  wp db import backup.sql --path="$SITE_PATH"

  # 4. Notification via Slack webhook
  curl -X POST -H 'Content-type: application/json' \
       --data "{\"text\":\"Recovery executed for $SITE_URL\"}" \
       https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK

  echo "$(date) - Recovery completed" >> "$LOG_FILE"
fi