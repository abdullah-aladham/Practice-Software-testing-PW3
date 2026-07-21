// spec: Homepage Tests
// seed: tests/seed.spec.ts

import { test, expect } from '@playwright/test';

test.describe('Homepage Tests', () => {
  test('Homepage - Smoke', async ({ page }) => {
    // 1. Navigate to the homepage at https://practicesoftwaretesting.com/
    await page.goto('https://practicesoftwaretesting.com/');

    // 2. Verify the page loads and the document title contains "Practice" or "Software".
    await expect(page).toHaveTitle(/Practice|Software/i);

    // 3. Verify the main heading (h1) is present and has non-empty text.
    const headingText = await page.evaluate(() => {
      const text = 'Practice Black Box Testing & Bug Hunting';
      const nodes = Array.from(document.querySelectorAll('body *')).filter(n => n.textContent && n.textContent.includes(text));
      if (nodes.length) return nodes[0].textContent?.trim() || '';
      const el = document.querySelector('h1,h2,h3,header h1,header h2');
      return el ? (el.textContent || '').trim() : '';
    });
    expect(headingText.length).toBeGreaterThan(0);

    // 4. Verify the primary navigation contains at least one visible link (Home).
    await expect(page.locator('[data-test="nav-home"]').first()).toBeVisible();

    // 5. Verify the main hero/banner or introductory section contains visible text.
    await expect(page.getByText('Practice Black Box Testing & Bug Hunting')).toBeVisible();

    // 6. Take a snapshot of the page for visual review.
    await page.screenshot({ path: 'tests/homepage-snapshot.png', fullPage: true });
  });
});
