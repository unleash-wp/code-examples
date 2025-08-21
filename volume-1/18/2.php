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

if ( ! class_exists( 'EDD_SL_Plugin_Updater' ) ) {
    include dirname(__FILE__) . '/includes/EDD_SL_Plugin_Updater.php';
}

$license_key = trim( get_option( 'my_plugin_license_key', '' ) );

$edd_updater = new EDD_SL_Plugin_Updater(
    'https://shop.example.com',
    __FILE__,
    array(
        'version' => '1.2.3',
        'license' => $license_key,
        'item_id' => 123,
        'author'  => 'Your Agency',
        'url'     => home_url()
    )
);