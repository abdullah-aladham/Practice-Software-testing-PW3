import { test, expect } from '@playwright/test';
// import baseURL from '../playwright.config';

test.describe('Test group', () => {
  test('seed', async ({ page }) => {
    // generate code here.
    await page.goto('/');
    // await expect(page).toHaveTitle(/Practice Software Testing/);
  });

});
