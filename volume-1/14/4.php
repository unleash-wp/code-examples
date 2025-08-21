<?php
/**
 * This file is part of the UnleashWP Code Examples.
 *
 * Copyright (C) 2025 Benjamin Zekavica
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


function my_cache_key(string $base): string {
    return sprintf(
        'blog_%d:locale_%s:%s',
        get_current_blog_id(),
        get_locale(),
        $base
    );
}