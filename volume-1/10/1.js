/**
 * This file is part of the UnleashWP Code Examples.
 *
 * Copyright (C) 2025 Benjamin Zekavica
 *
 * Licensed under the GNU GPL v3 or later.
 * See <https://www.gnu.org/licenses/>.
 */

import { test, expect } from '@playwright/test';

test('Admin Login works', async ({ page }) => {
  await page.goto('http://localhost/wp-login.php');

  await page.fill('#user_login', 'admin');
  await page.fill('#user_pass', 'supersecure');
  await page.click('#wp-submit');

  await expect(page).toHaveURL(/\/wp-admin/);
});