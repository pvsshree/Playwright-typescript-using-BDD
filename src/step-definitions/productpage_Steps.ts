import { Then, When } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { pageFixture } from './hooks/browserContextFIxture';

Then('The product {string} is displayed on the product page', async (productName: string) => {
    await expect(pageFixture.page.getByText(productName, { exact: true })).toBeVisible();
});

When('User adds the product {string} to cart', async (productName: string) => {
    const productCard = pageFixture.page.locator('.inventory_item').filter({ hasText: productName });
    await productCard.getByRole('button', { name: 'Add to cart' }).click();
});

Then('The cart badge should display {string}', async (count: string) => {
    await expect(pageFixture.page.locator('.shopping_cart_badge')).toHaveText(count);
});
