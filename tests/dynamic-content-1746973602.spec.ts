import { test, expect } from '@playwright/test';

test.describe('Dynamic Content Tests', () => {
  test('should verify dynamic content loading', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/dynamic_content');
    const content = await page.locator('.large-10').all();
    expect(content.length).toBeGreaterThan(0);
  });
});
