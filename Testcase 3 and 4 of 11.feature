//TC3
    Scenario: Navigate to a facility "Facility D" that already has one or more borrowers allocated
        When User navigate to "Facility D" that already has one or more borrowers allocated 
        Then The facility view is displayed with visual tags for "Borrower X" and "Borrower Y"
        Then The allocated borrower count is "2"

    Scenario: Locate the visual tag for "Borrower X"
        When User locate the visual tag for "Borrower X"
        Then The tag for "Borrower X" is visible and contains a small "A-" icon
       
    Scenario: Click the "A-" icon on "Borrower X" tag
        When User clicks the "A-" icon on "Borrower X" tag
        Then The visual tag for "Borrower X" is removed from UL 2. The tag for "Borrower Y" remains 3
        Then The "Allocated Borrowers" count in the Compact Metrics Panel updates from "2" to "1"

    Scenario: Click the "Select Borrowers" button to view the list
        When User clicks the "Select Borrowers" button to view the list
        Then In the dropdown list "Borrower X" is no longer shown as allocated (it appears as available to be selected again) 


//TC4
    Scenario: Navigate to a facility "Facility E" with atleast two borrowers allocated
        When User navigate to "Facility E" with atleast two borrowers allocated 
        Then The "Borrower Allocation" section shows "Borrower P" and "Borrower Q" are allocated
        Then The "Joint & Several" dropdown is set to "Joint"

    Scenario: Click the "Joint & Several" dropdown  
        When User clicks on the "Joint & Several" dropdown 
        Then A list of options appears, containing"Joint & Several"


    Scenario: Select "Several" from the dropdown
        When User selects "Several" from the dropdown
        Then The dropdown's value changes to and displays "Several"


    Scenario: Save the facility changes and reload the page 
        When User clicks Save the facility changes and reload the page 
        And User reloads the page
        Then The "Joint & Several" dropdown retains the value "Several"
