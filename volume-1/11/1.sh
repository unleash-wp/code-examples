# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

wp eval "
for (\$i = 0; \$i < 10; \$i++) {
    wp_insert_post([
        'post_title'   => 'Test ' . (\$i + 1),
        'post_content' => 'Lorem ipsum dolor sit amet...',
        'post_status'  => 'publish'
    ]);
}"