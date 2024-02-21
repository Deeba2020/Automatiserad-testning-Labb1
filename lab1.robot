
*** Settings ***

Documentation    lab-1
Library    SeleniumLibrary
Library    Collections
Library     XML
Suite Setup     setup
Resource        resources.robot


*** Test Cases ***





open website and verify its correct website
   # given setup
    when check if website opens correctly by waiting to see infotivCarRental
    and check if website opens correctly by waiting to see "When do you want to make your trip?"
    then check if website is open correctly by waiting to see field to enter email
    and check if website opens correctly by waiting to see field to enter password


login with existing credentials
    given user enters correct password and email using existing credentials
    when user clicks login button
    then user is able to see a welcome message with the name of the user


select date to book car
    given log out button is visible
    when user clicks continue button on date selection page
    then user is able to see what Would You Like To Drive quesion


select a car to book
    given user is able to see back to date button on the page
    when user clicks book button
    then user is able to see confirm button

to confirm booking
    given user is able to see the confirm booking text
    when user enters the card number
    and user enters the name for the card
    and user enters the month for the card
    and user enters the year for the card
    and user enters the cvc code
    and user click on confirm button
    then user is able to see booking is successful a message with details of the registered booking



successful booking
    given user is able to see home button
    when user clicks on my page
    and user is able to see license of the booked car
    then user is able to see cancel booking button

