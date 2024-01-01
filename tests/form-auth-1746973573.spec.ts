import { test, expect } from '@playwright/test';

test.describe('Form Authentication Tests', () => {
  test('should login with valid credentials', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/login');
    await page.fill('#username', 'tomsmith');
    await page.fill('#password', 'SuperSecretPassword!');
    await page.click('button[type=submit]');
    await expect(page.locator('text=You logged into a secure area!')).toBeVisible();
  });
});
