import { test, expect } from '@playwright/test';

test.describe('Dropdown Tests', () => {
  test('should select option from dropdown', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/dropdown');
    await page.selectOption('#dropdown', 'Option 1');
    await expect(page.locator('#dropdown')).toHaveValue('1');
  });
});
