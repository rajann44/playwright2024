import { test, expect } from '@playwright/test';

test.describe('Dynamic Loading Tests', () => {
  test('should wait for hidden element', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/dynamic_loading/1');
    await page.click('button');
    await expect(page.locator('#finish')).toBeVisible({ timeout: 10000 });
  });
});
