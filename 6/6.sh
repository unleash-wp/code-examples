# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.


#!/bin/bash
# sync-live.sh
set -e

# Export DB from live server
ssh user@live-server 'wp db export /tmp/live-db.sql && exit'

# Copy DB to local
scp user@live-server:/tmp/live-db.sql ./

# Import into DDEV
ddev import-db --src=live-db.sql

# Search-replace live URLs with local
ddev wp search-replace 'https://www.live.de' 'https://projekt.ddev.site' \
  --skip-columns=guid --all-tables

# Sync uploads directory
rsync -avz user@live-server:path/wp-content/uploads/ ./wp-content/uploads/