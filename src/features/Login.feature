Feature: Login functionality
    Scenario: Login details
        Given User is on sauce demo login page
        When User enters username
        And User enters password
        And User clicks on Login button
        Then User navigates to Products page

    Scenario: Product displayed on product page
        Given User is on sauce demo login page
        When User enters username
        And User enters password
        And User clicks on Login button
        Then User navigates to Products page
        And The product "Sauce Labs Backpack" is displayed on the product page

    Scenario: Invalid Login details
        Given User is on sauce demo login page
        When User enters invalid username
        And User enters invalid password
        And User clicks on Login button
        Then Error message is dispalyed