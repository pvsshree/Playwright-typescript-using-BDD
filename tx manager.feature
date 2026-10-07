Feature: Transaction Manager navigates to a deal with at least one facility

    Background:
        When I login Citi Velocity as a "Transaction Manager"
        Then It opens Helios Dashboard page
        Then Navigate to Deal page

    //TC1
    Scenario: Navigate to a deal containing at least one facility
        Then Deal exists containing "Facility A"
        Then The user successfully navigates to the deal page


    //TC2
    Scenario: Select Facility A from the list of facilities
        When The user selects "Facility A" from the list of facilities
        Then The main view updates to show the details for "Facility A"


    //TC3
    Scenario: Verify the "Borrower Allocation" section is visible
        When The User scroll to the "Borrower Allocation" section
        Then The "Borrower Allocation" section is visible


    //TC4
    Scenario: Inspect the "Borrower Allocation" section
        Then A dropdown field labeled "Joint & Several" is present

    //TC5
    Scenario: Verify the value of the "Joint & Several" section
        Then The dropdown selected value defaults to "Joint"

    //TC6
    Scenario: Locate the "Comapct Metrics Panel"
        When Locate the "Comapct Metrics Panel" or equivalent summary view for the facility
        Then The panel is visible and displays a metric for "Allocated Borrowers" which currently shows "0"


    //TC6
    Scenario: Navigate to a deal that has no borrowers defined in its master list
        When Deal contains "Facility A" and Master Borrower list is empty
        Then The user successfully navigates to the deal page


    //TC7
    Scenario: Select Facility A from the list of facilities
        When The user selects "Facility A" with Master Borrower list as empty
        Then The view updates to show the details for "Facility A"


     
    //TC8
    Scenario: Observe the "Borrower Allocation" section
        Then A clear warning message is displayed. "No borrowers are defined in the deal's master list. Please add borrowers at the deal level to proceed"
        
   

