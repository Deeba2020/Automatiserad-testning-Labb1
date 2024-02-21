
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



