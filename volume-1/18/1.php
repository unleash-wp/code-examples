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


require_once __DIR__ . '/vendor/plugin-update-checker/plugin-update-checker.php';

use YahnisElsts\PluginUpdateChecker\v5\PucFactory;

$updateChecker = PucFactory::buildUpdateChecker(
    'https://github.com/your-org/your-plugin/',
    __FILE__,
    'your-plugin-slug'
);

// Optional: Use authentication for private repos
$githubToken = defined('GITHUB_TOKEN') ? GITHUB_TOKEN : null;
if ($githubToken) {
    $updateChecker->setAuthentication($githubToken);
}