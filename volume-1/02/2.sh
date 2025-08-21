# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

#!/bin/bash
set -e

# Configure and start DDEV project
ddev config --project-type=wordpress --docroot=web --create-docroot
ddev start

# Download and configure WordPress
ddev wp core download --locale=de_DE
ddev wp config create --dbname=db --dbuser=db --dbpass=db --skip-check
ddev wp db create

# Install WordPress
ddev wp core install \
  --url=https://my-wp.ddev.site \
  --title="My WP Site" \
  --admin_user=admin \
  --admin_password=admin \
  --admin_email=admin@example.com

echo "WordPress is ready at https://my-wp.ddev.site"