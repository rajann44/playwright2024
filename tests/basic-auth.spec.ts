import { test, expect } from '@playwright/test';

test.describe('Basic Authentication Tests', () => {
  test('should authenticate with valid credentials', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/basic_auth', {
      httpCredentials: {
        username: 'admin',
        password: 'admin'
      }
    });
    await expect(page.locator('text=Congratulations!')).toBeVisible();
  });
});
