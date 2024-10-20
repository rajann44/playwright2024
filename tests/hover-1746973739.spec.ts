import { test, expect } from '@playwright/test';

test.describe('Hover Tests', () => {
  test('should show additional information on hover', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/hovers');
    await page.hover('.figure');
    await expect(page.locator('.figcaption')).toBeVisible();
  });
});
