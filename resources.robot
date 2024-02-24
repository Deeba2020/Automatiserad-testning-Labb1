
*** Settings ***

Documentation    lab-1
Library    SeleniumLibrary
Library    Collections
Library     XML



*** Variables ***
#open website locators
${url}      https://rental13.infotiv.net/
${infotivCarRental}   //h1[@id='title']
${dateQuesion}      //h1[@id='questionText']


# open webiste variables
${infotivLogo}
${visibleDateQuesion}
${visibleEmailField}
${visiblePasswdField}


#Login locators
${login-E-mail}        //input[@id='email']
${login-password}        //input[@id='password']
${youAreSignedInAsDeba}       //label[@id='welcomePhrase']
${loginButton}     //button[@id='login']
${welcomePhrase}      //label[@id='welcomePhrase']
${historyButton}        //button[@id='show']
${logoutButton}      //button[@id='logout']


#login variables
${primaryEmail}        deebarf@gmail.com
${primaryPassword}        infotiv2024


#following are locators for creating new custome for the first time
${createNewUser}        //h1[@id='questionText']
${firstName}        //input[@id='name']
${lastName}        //input[@id='last']
${phoneNumber}        //input[@id='phone']
${E-mail}        //input[@id='emailCreate']
${confirm-E-mail}        //input[@id='confirmEmail']
${password}        //input[@id='passwordCreate']
${confirmPassword}        //input[@id='confirmPassword']
${createButton}        //button[@id='create']
${whatWouldYouLikeToDrive}     //h1[@id='questionText']


#follwing are customer details when we want to create new customer
${inputName}        Deba0
${inputLastName}        Arif0
${createUser}       //button[@id='createUser']
${inputPhoneNumber}        004614225178
${new-E-mail}        deebarf203@gmail.com
${newPassword}        infotiv9314


#locator for selecting date
${startMonth}       //input[@id='start']
${startDay}        //input[@id='start']
${endMonth}        //input[@id='end']
${endDay}        //input[@id='end']
${continueButton}       //button[@id='continue']
#${whatWouldYouLikeToDrive}       //h1[@id='questionText']
${log-out}      //button[@id='logout']


#variables for renting car
${inputStartMonth}      02
${inputStartDay}        13
${inputEndMonth}        03
${inputEndDay}          13


#locator for selecting car
${backToDate}       //button[@id='backToDateButton']
${bookButton}       //tbody/tr[1]/td[5]/form[1]/input[4]  #to book car from first row
${bookButtonThird}      //tbody/tr[3]/td[5]/form[1]/input[4]   #to book car from third row
${confirmButton}        //button[@id='confirm']
${makeButton}      //div[@id='ms-list-1']//button[@type='button']
${passengersButton}         //div[@id='ms-list-2']//button[@type='button']
${vivaro}       //td[normalize-space()='Vivaro']
${Audi}     //input[@id='ms-opt-1']
${filterInstruction}        //label[contains(text(),'No cars with selected filters. Please edit filter ')]


#variables for selecting car
${passengerNum}     //input[@id='ms-opt-9']


#locator for confirm booking
${confirmBookingTxt}       //h1[@id='questionText']
${cardNumber}       //input[@id='cardNum']
${cardMonth}       //select[@title='Month']
${cardYear}         //select[@title='Year']
${cardCVC}        //input[@id='cvc']
${cancelBooking}        //button[@id='cancel']
${cardHolder}        //input[@id='fullName']
${cancelCar}       //button[@id='unBook1']
${successfulBooking}        //h1[@id='questionTextSmall']
${homeButton}       //button[@id='home']
${mypageButton}       //button[@id='mypage']


#variables to confirm booking
${enterCardNumber}      1234567812345678
${enterCardMonth}       6
${enterCardYear}         2018
${enterCardCVC}        123
${enterCardHolder}      Deba


#locator for successful booking
${licenseNoRow1}       //td[@id='licenseNumber1']
${licenseNoRow2}        //td[@id='licenseNumber2']


#locator for successful booking
${about-button}         //a[@id='about']
${documentation}        //div[@id='mainWrapperBody']//a[1]



*** Keywords ***

website opens correctly and make sure user is not logged in
    [Documentation]     check if website is open correctly
    [Tags]        VG_test
    #Set Selenium Speed    1    #used to control the speed
    Open Browser    browser=Chrome
    Go To   ${url}
    Maximize Browser Window
    ${infotivLogo}=       Run Keyword And Return Status      Wait Until Element Is Visible    ${infotivCarRental}
    Log To Console    ${infotivLogo}

    IF    '$infotivLogo == True'
        Log    website status: website opened successfuly infotivLogo is visible
    ELSE
        Log    List eqaulity status: website could not be opened and infotivLogo is not visible
    END

    Wait Until Element Is Visible    ${dateQuesion}
    Wait Until Element Is Visible    ${login-E-mail}


user enters correct password and email to log in using existing credentials
    [Documentation]     logging in
    [Tags]       VG_test
    [Arguments]     ${email}     ${password}
    Log     email: ${email}
    Log     password: ${password}
    Input Text      ${login-E-mail}       ${email}
    Input Password     ${login-password}      ${password}
    Click Button    ${loginButton}
    Wait Until Element Is Visible    ${welcomePhrase}


user can click on my page to see booking history
   [Documentation]     to make sure all functionality is working after user logged in
   [Tags]       VG_test
   Click Button    ${mypageButton}
   Wait Until Element Is Visible    ${historyButton}



user can click log out button after signing in
    [Documentation]     logging out
    [Tags]       VG_test
    Click Button    ${logoutButton}
    Wait Until Element Is Visible    ${loginButton}
    Close Browser


user books a car
  [Documentation]     to click continue and use the defualt today date
  [Tags]        VG_test
  [Arguments]       ${cardNumberArg}       ${cardHolderArg}       ${cardMonthArg}        ${cardYearArg}     ${cardCVCArg}
  Click Button    ${continueButton}
  Wait Until Element Is Visible    ${whatWouldYouLikeToDrive}
  Wait Until Element Is Visible    ${backToDate}
  Click Button    ${bookButton}
  Wait Until Element Is Visible    ${confirmButton}
  Wait Until Element Is Visible    ${confirmBookingTxt}
  Input Text    ${cardNumber}    ${cardNumberArg}
  Input Text    ${cardHolder}    ${cardHolderArg}
  Select From List By Label    ${cardMonth}       ${cardMonthArg}
  Select From List By Label    ${cardYear}       ${cardYearArg}
  Input Text    ${cardCVC}    ${cardCVCArg}
  Click Button    ${confirmButton}
  Wait Until Element Is Visible       ${successfulBooking}
  Wait Until Element Is Visible       ${homeButton}


user can verify that the car is booked by clicking on my page
    [Documentation]     to be able to go to my page and see user history
    [Tags]        VG_test
    Click Button       ${mypageButton}
    Wait Until Element Is Visible       ${licenseNoRow1}
    Wait Until Element Is Visible    ${cancelCar}
    Close Browser

#extra test cases
user clicks on it to create user button
    [Documentation]     click on create user and create new account
    [Tags]      VG_test
    [Arguments]     ${inputNameArg}        ${inputLastNameArg}        ${inputPhoneNumberArg}     ${new-E-mailArg}       ${new-E-mailArg}       ${newPasswordArg}      ${newPasswordArg}
    Wait Until Element Is Visible    ${createUser}
    Click Button    ${createUser}
    Input Text      ${firstName}      ${inputNameArg}
    Input Text      ${lastName}       ${inputLastNameArg}
    Input Text      ${phoneNumber}       ${inputPhoneNumberArg}
    Input Text      ${E-mail}       ${new-E-mailArg}
    Input Text      ${confirm-E-mail}       ${new-E-mailArg}
    Input Password     ${password}      ${newPasswordArg}
    Input Password     ${confirmPassword}      ${newPasswordArg}
    Click Button    ${createButton}


user filter car according to number of passenger
    [Documentation]     to filter car according to number of passenger
    [Tags]      VG_test
    [Arguments]    ${passengerNumArg}
    Click Button    ${continueButton}
    Wait Until Element Is Visible    ${passengersButton}
    Click Element    ${passengersButton}
    Click Element    ${passengerNumArg}
    Wait Until Element Is Visible    ${vivaro}


user can click on back to date button
    [Documentation]     click on back to date button
    [Tags]      VG_test

    Wait Until Element Is Visible    ${backToDate}
    Click Button    ${backToDate}
    Wait Until Element Is Visible    ${dateQuesion}
    Close Browser
    ##


user can click on about button and about page will be visible
    [Documentation]     click on about button
    [Tags]      VG_test
    Click Button       ${mypageButton}
    Wait Until Element Is Visible    ${about-button}
    Click Element    ${about-button}
    Wait Until Element Is Visible    ${documentation}


#negative test cases
user both filter on car selection page and the filtered car is not available
    [Documentation]     to test the case when filtered car is not available
    [Tags]      VG_test
    [Arguments]    ${passengerNumArg}       ${selectedCarArg}
    Click Button    ${continueButton}
    Wait Until Element Is Visible    ${passengersButton}
    Click Element    ${passengersButton}
    Click Element    ${passengerNumArg}
    Click Element    ${makeButton}
    Click Element    ${selectedCarArg}


user gets instruction to choose different car since the filtered car is not available
    [Documentation]     to test the case when filtered car is not available user gets informed
    [Tags]      VG_test
    Wait Until Element Is Visible   ${filterInstruction}
    Close Browser



select a date which is earlier than today date
  [Documentation]     renting car
  [Tags]        VG_test
  Input Text      ${startMonth}       ${inputStartMonth}
  Input Text      ${startDay}        ${inputStartDay}
  Input Text      ${EndMonth}       ${inputEndMonth}
  Input Text      ${EndDay}        ${inputEndDay}
  Click Button    ${continueButton}


user can not continue to the next page
  Wait Until Page Does Not Contain    ${whatWouldYouLikeToDrive}
  Close Browser




date is set to today's date, to be checked later how to use it!
  [Documentation]     set date to today's date
  [Tags]       VG_test
  ${startDate}=        Get Time        dateFormat=%y-%m-%d
  Log      today date: ${startDate}
  Input Text      ${startMonth}        ${startDate}


  #clean up
  #no variable for one time used locator
  #clean up code
  #no space between code
  #wait until page containe use it from time to time
  #click element does it work for text
  #no Lod for password, email , date



#website opens correctly by waiting to see "When do you want to make your trip?"

    #[Documentation]     check if website is open correctly by waiting to see trip date quesion
  #  [Tags]        VG_test

    #Wait Until Element Is Visible    ${dateQuesion}
    #${visibleDateQuesion}=       Run Keyword And Return Status      Wait Until Element Is Visible    ${dateQuesion}
    #Log To Console    ${visibleDateQuesion}

    #IF    '$visibleDateQuesion == True'
      #  Log    website status: website opened successfuly quesion to enter date trip is seen
    #ELSE
     #   Log    List eqaulity status: website could not be opened  quesion to enter date trip is not seen
   #END



#check that user is not logged in by waiting to see field to enter email
    #[Documentation]     double check use is not logged in by waiting to see field to enter email
    #[Tags]        VG_test

    #Wait Until Element Is Visible    ${login-E-mail}
    #${visibleEmailField}=       Run Keyword And Return Status      Wait Until Element Is Visible    ${login-E-mail}
    #Log To Console    ${visibleEmailField}

    #IF    '$visibleEmailField == True'
        #Log    website status: website opened successfuly feild to login email is visible
    #ELSE
        #Log    List eqaulity status: website could not be opened feild to login email is not visible
   # END


#check if website opens correctly by waiting to see field to enter password

    #[Documentation]     check if website is open correctly by waiting to see field to enter password
    #[Tags]        VG_test

    #Wait Until Element Is Visible    ${login-password}
    #${visiblePasswdField}=       Run Keyword And Return Status      Wait Until Element Is Visible     ${login-password}
    #Log To Console    ${visiblePasswdField}

    #IF    '$visiblePasswdField == True'
        #Log    website status: website opened successfuly feild to enter password is visible
    #ELSE
        #Log    List eqaulity status: website could not be opened feild to enter password is not visible
    #END



#user is able to see what Would You Like To Drive quesion
  #[Documentation]     to verify that the date selection was successful
  #[Tags]        VG_test
  # Wait Until Element Is Visible    ${whatWouldYouLikeToDrive}




#rent car /to be used later! for -ve test cases!
  # [Documentation]     renting car
   #[Tags]        VG_test

   #Input Text      ${startMonth}       ${inputStartMonth}
   #Input Text      ${startDay}        ${inputStartDay}

   #Input Text      ${EndMonth}       ${inputEndMonth}
   #Input Text      ${EndDay}        ${inputEndDay}

   #Click Button    ${continueButton}

   #Wait Until Element Is Visible    ${whatWouldYouLikeToDrive}


#user is able to see back to date button on the page /not used
  # [Documentation]     to verify that the user is on car selection page
   #[Tags]        VG_test
   #Wait Until Element Is Visible    ${backToDate}


#user clicks book button  to be used later!
  # [Documentation]     user select a car by clicking book button
   #[Tags]        VG_test
   #Click Button    ${bookButton}
   #Select From List By Label    ${passengers}       9


#user clicks book button
   #[Documentation]     user select a car by clicking book button
   #[Tags]        VG_test
   #Click Button    ${bookButton}


#user is able to see confirm button
   #[Documentation]     user is able to see confirm button after selectin the car
   #[Tags]        VG_test
   #Wait Until Element Is Visible    ${confirmButton}


#user is able to see the confirm booking text
    #[Documentation]     user is able to see confirm booking text with selected car model
   # [Tags]        VG_test
   # Wait Until Element Is Visible    ${confirmBookingTxt}



