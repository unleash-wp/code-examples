# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

mkdir -p wp-content/mu-plugins/project-core

cat <<EOL > wp-content/mu-plugins/project-core/project-core.php
<?php
/**
 * Plugin Name: Project Core
 * Description: Core functions for the project.
 */

require_once __DIR__ . '/src/setup.php';
EOL