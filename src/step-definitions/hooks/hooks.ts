import{BeforeAll, AfterAll, Before, After} from '@cucumber/cucumber'
import { Browser, chromium, Page } from '@playwright/test'
import { pageFixture } from './browserContextFIxture';

let browser: Browser;

BeforeAll(async function() {   })
    
AfterAll(async function() {})

//Runs before each scenario
Before(async function(){
    browser = await chromium.launch({headless: false});
    pageFixture.context = await browser.newContext({viewport: {width: 1920, height: 1080}});
    pageFixture.page = await pageFixture.context.newPage();
    
})                   

//After(async function(){
//await pageFixture.page.close();
//await browser.close();

//})