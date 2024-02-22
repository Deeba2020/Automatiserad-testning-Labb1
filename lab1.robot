
*** Settings ***

Documentation    lab-1
Library    SeleniumLibrary
Library    Collections
Library     XML
Resource        resources.robot


*** Test Cases ***

login with existing credentials
    given website opens correctly and make sure user is not logged in
    when user enters correct password and email to log in using existing credentials       ${primaryEmail}      ${primaryPassword}
    and user can click on my page to see booking history
    then user can click log out button after signing in



to book a car and verify that it is booked
    given website opens correctly and make sure user is not logged in
    and user enters correct password and email to log in using existing credentials     ${primaryEmail}      ${primaryPassword}
    when user books a car       ${enterCardNumber}      ${enterCardHolder}      ${enterCardMonth}       ${enterCardYear}        ${enterCardCVC}
    then user can verify that the car is booked by clicking on my page


#extra functions
#to fill customer details and create new account
    #given website opens correctly and make sure user is not logged in
    #when user clicks on it to create user button        ${inputName}        ${inputLastName}        ${inputPhoneNumber}     ${new-E-mail}       ${new-E-mail}       ${newPassword}      ${newPassword}
    #then user can click log out button after signing in


to filter a car and verify that it is filtered
    given website opens correctly and make sure user is not logged in
    and user enters correct password and email to log in using existing credentials     ${primaryEmail}      ${primaryPassword}
    when user filter car according to number of passenger       ${passengerNum}
    then user can click on back to date button


to test user can go to about page from my page
    given website opens correctly and make sure user is not logged in
    and user enters correct password and email to log in using existing credentials     ${primaryEmail}      ${primaryPassword}
    when user can click on about button and about page will be visible
    then user can click log out button after signing in

