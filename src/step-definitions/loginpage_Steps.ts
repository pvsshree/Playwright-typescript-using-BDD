import {Given, When } from '@cucumber/cucumber';
import {Browser} from '@playwright/test';

let browser: Browser; //browser instance chrome or forefox opened by playwright
let context: any; //browser context (a separate browsing session ) each context has its own cookies storage
Given('User is on sauce demo login page', async () => {
   console.log("Step 1");
});

When('User enters username', async () => {
    console.log("Step 2");
});