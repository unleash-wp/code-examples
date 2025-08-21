# This file is part of the UnleashWP Code Examples.
# Copyright (C) 2025 Benjamin Zekavica
#
# Licensed under the GNU GPL v3 or later.
# See <https://www.gnu.org/licenses/>.

ddev wp option update blogdescription "XY"
ddev wp rewrite flush
ddev wp plugin activate contact-form-7