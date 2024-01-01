import { test, expect } from '@playwright/test';
import path from 'path';

test.describe('File Upload Tests', () => {
  test('should upload a file successfully', async ({ page }) => {
    await page.goto('https://the-internet.herokuapp.com/upload');
    const filePath = path.join(__dirname, 'test-file.txt');
    await page.setInputFiles('#file-upload', filePath);
    await page.click('#file-submit');
    await expect(page.locator('text=File Uploaded!')).toBeVisible();
  });
});
