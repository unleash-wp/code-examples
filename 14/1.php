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

$args = [
    'post_type'      => 'attachment',
    'post_parent'    => $post_id,
    'posts_per_page' => -1,
    'fields'         => 'ids',
    'orderby'        => 'menu_order',
    'order'          => 'ASC',
    'post_mime_type' => 'image',
    'suppress_filters' => false,
    'lang'           => '',
];