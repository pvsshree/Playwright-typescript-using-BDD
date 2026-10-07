  //TC2
    Scenario: Navigate to a deal that has no borrowers defined in its master list
        When Deal contains "Facility A" and Master Borrower list is empty
        Then The user successfully navigates to the deal page


    Scenario: Select Facility A from the list of facilities
        When The user selects "Facility A" with Master Borrower list as empty
        Then The view updates to show the details for "Facility A"


    Scenario: Observe the "Borrower Allocation" section
        When User observe the "Borrower Allocation" section
        Then A clear warning message is displayed. "No borrowers are defined in the deal's master list. Please add borrowers at the deal level to proceed"


    Scenario: Observe the "Select Borrowers" button
        When The user look for "Select Borrowers" button or any control to add borrowers
        Then The "Select Borrowers" button is not visible or is disabled. The user cannot initiate borrower allocation for the facility
   

   Scenario: Re-open the "Select Borrowers" dropdown
        When User re-open the "Select Borrowers" dropdown
        Then The list shows "Borrower A" as visually distinct (checked grayed out) from "Borrower B", indicating it is already allocated

//TC3
    Scenario: Navigate to a facility that already has one or more borrowers allocated
        When User navigate to a facility that already has one or more borrowers allocated 
        Then The facility view is displayed with visual tags for "Borrower X" and "Borrower Y"
        Then The allocated borrower count is "2"

    Scenario: Locate the visual tag for "Borrower X"
        When User locate the visual tag for "Borrower X"
        Then The tag for "Borrower X" is visible and contains a small "A-" icon
       
