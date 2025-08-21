# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

#!/bin/bash
set -e

# Project name & domain
PROJECT_NAME="myproject"
PROJECT_URL="https://${PROJECT_NAME}.ddev.site"

# Configure and start DDEV (if not already configured)
ddev config --project-type=wordpress --docroot=web --create-docroot
ddev start

# WordPress install
ddev wp core download --locale=de_DE
ddev wp config create --dbname=db --dbuser=db --dbpass=db --skip-check
ddev wp db create
ddev wp core install \
    --url="$PROJECT_URL" \
    --title="$PROJECT_NAME" \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=dev@example.com

# Site config
ddev wp option update blogdescription "Project setup via CLI"
ddev wp rewrite structure "/%postname%/"
ddev wp plugin delete hello akismet

# Plugins & theme
ddev wp theme install twentytwentythree --activate
ddev wp plugin install advanced-custom-fields --activate