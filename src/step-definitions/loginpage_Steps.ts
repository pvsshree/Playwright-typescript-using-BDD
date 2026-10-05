import {Given, When, Then } from '@cucumber/cucumber';
import { pageFixture } from './hooks/browserContextFIxture';
import{expect} from '@playwright/test'

Given('User is on sauce demo login page', async () => {

    //setup browser instance added into hooks file using browser and page fixture

//Access url
await pageFixture.page.goto("https://www.saucedemo.com/");
});

When('User enters username', async () => {
    await pageFixture.page.getByPlaceholder("Username").fill("standard_user");
});

When('User enters password', async () => {
  await pageFixture.page.getByPlaceholder("Password").fill("secret_sauce");
});

When('User clicks on Login button', async () => {
  await pageFixture.page.locator("#login-button").click();
});

Then('User navigates to Products page', async () => {
    await pageFixture.page.waitForSelector(".inventory_list", { state: "visible", timeout: 10000 });
 await expect(pageFixture.page).toHaveURL(/inventory/);
});

When("User enters invalid username", async function () {
  await pageFixture.page.fill("#user-name", "wrong_user");
});

When("User enters invalid password", async function () {
  await pageFixture.page.fill("#password", "wrong_password");
});

Then('Error message is dispalyed', async () =>{
const error = await pageFixture.page.getByRole("alert");
await expect(error).toBeVisible();
await expect(error).toContainText("Epic sadface: Username and password do not match any user in this service");
await console.log("Displayed");

});