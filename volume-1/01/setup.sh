# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.


#!/bin/bash
read -p "Enter the project name (e.g. my-wp): " PROJ
mkdir $PROJ && cd $PROJ

# Configure new DDEV project
ddev config --project-type=wordpress --docroot=web --create-docroot --project-name=$PROJ
ddev start

# Download latest WordPress into /web
ddev wp core download --path=web

# Install WordPress with default credentials
ddev wp core install \
  --url="https://$PROJ.ddev.site" \
  --title="$PROJ Site" \
  --admin_user=admin \
  --admin_password=admin \
  --admin_email=admin@example.com

echo "WordPress DDEV project '$PROJ' created successfully!"
echo "Open: https://$PROJ.ddev.site"
