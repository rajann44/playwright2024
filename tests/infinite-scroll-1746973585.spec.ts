import { test, expect } from '@playwright/test';

test.describe('Infinite Scroll Tests', () => {
  test('should load more content on scroll', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/infinite_scroll');
    const initialCount = await page.locator('.jscroll-added').count();
    await page.evaluate(() => window.scrollTo(0, document.body.scrollHeight));
    await page.waitForTimeout(1000);
    const newCount = await page.locator('.jscroll-added').count();
    expect(newCount).toBeGreaterThan(initialCount);
  });
});
