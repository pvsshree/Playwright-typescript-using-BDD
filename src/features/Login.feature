Feature: Login functionality
    Scenario: Login details
        Given User is on sauce demo login page
        When User enters username
        And User enters password
        And User clicks on Login button
        Then User navigates to Products page
