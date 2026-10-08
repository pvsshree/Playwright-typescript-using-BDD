import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { Page } from 'playwright';

let page: Page;

When('The user navigates to a deal containing {string}', async function (facilityName: string) {
  page = this.page;
  await page.goto(`/deals?facility=${facilityName}`);
});

Then('The user successfully navigates to the deal page', async function () {
  await expect(page.locator('h1')).toContainText('Deal');
});

When('The user selects {string} from the list of facilities', async function (facilityName: string) {
  await page.click(`text=${facilityName}`);
});

Then('The main view updates to show the details for {string}', async function (facilityName: string) {
  await expect(page.locator('.facility-details')).toContainText(facilityName);
});

Then('The user click on the parties tab to view the list of parties associated with the deal', async function () {
  await page.click('text=Parties');
});

Then('The parties tab is visible and displays a list of parties associated with the deal', async function () {
  await expect(page.locator('#parties-list')).toBeVisible();
});

When('The user clicks on the {string} section to expand it', async function (sectionName: string) {
  await page.click(`text=${sectionName}`);
});

Then('The {string} section expands to show the list of allocated borrowers for {string}', async function (sectionName: string, facilityName: string) {
  await expect(page.locator(`#${sectionName.toLowerCase().replace(/\s+/g, '-')}-section`)).toBeVisible();
  await expect(page.locator(`#${sectionName.toLowerCase().replace(/\s+/g, '-')}-section`)).toContainText(facilityName);
});

Then('A dropdown field labeled {string} is present', async function (label: string) {
  await expect(page.locator(`label:has-text("${label}")`)).toBeVisible();
});

Then('The dropdown selected value defaults to {string}', async function (defaultValue: string) {
  const value = await page.locator('select#joint-several').inputValue();
  expect(value).toBe(defaultValue);
});

When('Locate the {string} or equivalent summary view for the facility', async function (panelName: string) {
  await expect(page.locator(`.summary-panel:has-text("${panelName}")`)).toBeVisible();
});

Then('The panel is visible and displays a metric for {string} which currently shows {string}', async function (metricName: string, metricValue: string) {
  const metric = page.locator(`.metric:has-text("${metricName}")`);
  await expect(metric).toBeVisible();
  await expect(metric).toContainText(metricValue);
});
