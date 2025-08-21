# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

#!/bin/bash
SITE_PATH="/var/www/html"
SITE_URL="https://example.com"
LOG_FILE="/var/log/wp-recovery.log"

# 1. Prevention: Pre-deployment checks
php -v
wp core is-installed --path="$SITE_PATH" || exit 1
wp plugin list --update=available --path="$SITE_PATH"
wp db check --path="$SITE_PATH" || exit 1

# 2. Detection: Heartbeat check
if [ "$(curl -s -o /dev/null -w "%{http_code}" $SITE_URL)" != "200" ]; then

    echo "$(date) - Issue detected, starting recovery" >> "$LOG_FILE"

    # 3. Recovery: Restart services and rollback
    systemctl restart php8.2-fpm
    systemctl restart nginx
    wp cache flush --path="$SITE_PATH"
    git reset --hard HEAD~1
    wp db import backup.sql --path="$SITE_PATH"

    # Notification
    curl -X POST -H 'Content-type: application/json' \
        --data "{\"text\":\"Recovery executed for $SITE_URL\"}" \
        https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK

    echo "$(date) - Recovery completed" >> "$LOG_FILE"
fi