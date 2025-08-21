# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

wp site list --field=url | while read -r url; do
  curl -fsS "$url" > /dev/null
  curl -fsS "$url/cat/new" > /dev/null
done