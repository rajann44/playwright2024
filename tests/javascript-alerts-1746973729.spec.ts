import { test, expect } from '@playwright/test';

test.describe('JavaScript Alerts Tests', () => {
  test('should handle alert', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/javascript_alerts');
    page.on('dialog', dialog => dialog.accept());
    await page.click('button[onclick="jsAlert()"]');
    await expect(page.locator('#result')).toHaveText('You successfully clicked an alert');
  });
});
