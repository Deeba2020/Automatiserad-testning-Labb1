
*** Settings ***

Documentation    lab-1
Library    SeleniumLibrary
Library    Collections
Library     XML
Suite Setup     setup


*** Variables ***

#${}        //input[@id='phone']
#@{}=    Create List
#@{}=    Create List
#@{}=    Create List

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

#login variables
${input-E-mail}        deebarf@gmail.com
${inputPassword}        infotiv2024


#following are locators for creating new custome for the first time
${createNewUser}        //h1[@id='questionText']
${createUser}       //button[@id='createUser']
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
${inputName}        Deba
${inputLastName}        Arif
${createUser}       //button[@id='createUser']
${inputPhoneNumber}        004612335678
${new-E-mail}        deebarf@gmail.com
${newPassword}        infotiv2024

#locator for selecting date
${startMonth}       //input[@id='start']
${startDay}        //input[@id='start']
${endMonth}        //input[@id='end']
${endDay}        //input[@id='end']
${continueButton}       //button[@id='continue']
${whatWouldYouLikeToDrive}       //h1[@id='questionText']
${log-out}      //button[@id='logout']



#variables for renting car
${inputStartMonth}      03
${inputStartDay}        13
${inputEndMonth}        04
${inputEndDay}          13


#locator for selecting car
${backToDate}       //button[@id='backToDateButton']
${bookButton}       //tbody/tr[1]/td[5]/form[1]/input[4]  #to book car from first row
${bookButtonThird}      //tbody/tr[3]/td[5]/form[1]/input[4]   #to book car from third row
${confirmButton}        //button[@id='confirm']
${make}      //div[@id='ms-list-1']//button[@type='button']
${passengers}         //span[normalize-space()='Passengers']
${scroll}        //html


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
${mypageButton}       //div[@id='backToStart']//button[@id='mypage']


#variables to confirm booking
${enterCardNumber}      1234567812345678
${enterCardMonth}       3
${enterCardYear}         2018
${enterCardCVC}        123
${enterCardHolder}      Deba

#locator for successful booking
${licenseNoRow1}       //td[@id='licenseNumber1']
${licenseNoRow2}        //td[@id='licenseNumber2']






*** Keywords ***
setup
    Set Selenium Speed    1    #used to control the speed
    Open Browser    browser=Chrome
    Go To   ${url}
    Maximize Browser Window


*** Test Cases ***
website opens successfuly user is able to see infotivCarRental on the website

    [Documentation]     check if website is open correctly by waiting to see infotiv car rental
    [Tags]        VG_test
    
    Wait Until Element Is Visible    ${infotivCarRental}
    ${infotivLogo}=       Run Keyword And Return Status      Wait Until Element Is Visible    ${infotivCarRental}
    Log To Console    ${infotivLogo}

    IF    '$infotivLogo == True'
        Log    website status: website opened successfuly infotivLogo is visible
    ELSE
        Log    List eqaulity status: website could not be opened and infotivLogo is not visible
    END


website opens successfuly user is able to see When do you want to make your trip? on the website

    [Documentation]     check if website is open correctly by waiting to see trip date quesion
    [Tags]        VG_test

    Wait Until Element Is Visible    ${dateQuesion}
    ${visibleDateQuesion}=       Run Keyword And Return Status      Wait Until Element Is Visible    ${dateQuesion}
    Log To Console    ${visibleDateQuesion}

    IF    '$visibleDateQuesion == True'
        Log    website status: website opened successfuly quesion to enter date trip is seen
    ELSE
        Log    List eqaulity status: website could not be opened  quesion to enter date trip is not seen
    END


website opens successfuly to the right is the user information field to enter email

    [Documentation]     check if website is open correctly by waiting to see field to enter email
    [Tags]        VG_test

    Wait Until Element Is Visible    ${login-E-mail}
    ${visibleEmailField}=       Run Keyword And Return Status      Wait Until Element Is Visible    ${login-E-mail}
    Log To Console    ${visibleEmailField}

    IF    '$visibleEmailField == True'
        Log    website status: website opened successfuly feild to login email is visible
    ELSE
        Log    List eqaulity status: website could not be opened feild to login email is not visible
    END


website opens successfuly to the right is the user information field to enter password

    [Documentation]     check if website is open correctly by waiting to see field to enter password
    [Tags]        VG_test

    Wait Until Element Is Visible    ${login-password}
    ${visiblePasswdField}=       Run Keyword And Return Status      Wait Until Element Is Visible     ${login-password}
    Log To Console    ${visiblePasswdField}

    IF    '$visiblePasswdField == True'
        Log    website status: website opened successfuly feild to enter password is visible
    ELSE
        Log    List eqaulity status: website could not be opened feild to enter password is not visible
    END


#click on creat customer profile
    #[Documentation]     click on create customer and make sure its on correct page
   # [Tags]      creating customer

    #Click Button    ${createUser}

    #Wait Until Element Is Visible    ${createNewUser}



#fill customer details on create customer page
    #[Documentation]     filling customer details
    #[Tags]

    #Input Text      ${firstName}      ${inputName}
    #Input Text      ${lastName}       ${inputLastName}
    #Input Text      ${phoneNumber}       ${inputPhoneNumber}
    #Input Text      ${E-mail}       ${new-E-mail}
    #Input Text      ${confirm-E-mail}       ${new-E-mail}
    #Input Password     ${password}      ${newPassword}
    #Input Password     ${confirmPassword}      ${newPassword}
    #Click Button    ${createButton}
    #Wait Until Page Contains    ${whatWouldYouLikeToDrive} #this does not match when is done automatically and manually


user enters correct password and email using existing credentials
    [Documentation]     logging in
    [Tags]       VG_test

    #[Arguments]     ${input-E-mail}     ${inputPassword}
    Input Text      ${login-E-mail}       ${input-E-mail}
    Input Password     ${login-password}      ${inputPassword}

user clicks login button
    Click Button    ${loginButton}

user is able to see a welcome message with the name of the user
    #Wait Until Page Contains        ${welcomePhrase}
    Wait Until Element Is Visible    ${welcomePhrase}




log out button is visible
  [Documentation]     to make sure that the user is logged in
  [Tags]        VG_test
  Wait Until Element Is Visible    ${log-out}


user clicks continue button on date selection page
  [Documentation]     to click continue and use the defualt today date
  [Tags]        VG_test
  Click Button    ${continueButton}



user is able to see what Would You Like To Drive quesion
  [Documentation]     to verify that the date selection was successful
  [Tags]        VG_test
   Wait Until Element Is Visible    ${whatWouldYouLikeToDrive}


#date is set to today's date, to be checked late how to use it!
  # [Documentation]     set date to today's date
   #[Tags]       VG_test
  # ${startDate}=        Get Time        dateFormat=%y-%m-%d
  # Log      today date: ${startDate}
  #Input Text      ${startMonth}        ${startDate}



#rent car /to be used later! for -ve test cases!
  # [Documentation]     renting car
   #[Tags]        VG_test

   #Input Text      ${startMonth}       ${inputStartMonth}
   #Input Text      ${startDay}        ${inputStartDay}

   #Input Text      ${EndMonth}       ${inputEndMonth}
   #Input Text      ${EndDay}        ${inputEndDay}
   
   #Click Button    ${continueButton}
   
   #Wait Until Element Is Visible    ${whatWouldYouLikeToDrive}


user is able to see back to date button on the page
   [Documentation]     to verify that the user is on car selection page
   [Tags]        VG_test
   Wait Until Element Is Visible    ${backToDate}


#user clicks book button  to be used later!
  # [Documentation]     user select a car by clicking book button
   #[Tags]        VG_test
   #Click Button    ${bookButton}
   #Select From List By Label    ${passengers}       9



user clicks book button
   [Documentation]     user select a car by clicking book button
   [Tags]        VG_test
   Click Button    ${bookButton}

   


user is able to see confirm button
   [Documentation]     user is able to see confirm button after selectin the car
   [Tags]        VG_test
   Wait Until Element Is Visible    ${confirmButton}



user is able to see the confirm booking text
    [Documentation]     user is able to see confirm booking text with selected car model
    [Tags]        VG_test
    Wait Until Element Is Visible    ${confirmBookingTxt}


user enters the card number
    [Documentation]     to enter card number for payment purpose
    [Tags]        VG_test
    Input Text    ${cardNumber}    ${enterCardNumber}
    

user enters the name for the card 
    [Documentation]     to enter name for the card  for payment purpose
    [Tags]        VG_test
    Input Text    ${cardHolder}    ${enterCardHolder}
    


user enters the month for the card
    [Documentation]     to enter month for the card  for payment purpose
    [Tags]        VG_test
    Select From List By Label    ${cardMonth}       ${enterCardMonth}
    
user enters the year for the card
    [Documentation]     to enter year for the card  for payment purpose
    [Tags]        VG_test
    Select From List By Label    ${cardYear}       ${enterCardYear}
    
    
user enters the cvc code
    [Documentation]     to enter CVC for the card  for payment purpose
    [Tags]        VG_test
    Input Text    ${cardCVC}    ${enterCardCVC}



user click on confirm button
    [Documentation]     to click confirm button  for payment purpose
    [Tags]        VG_test
    Click Button    ${confirmButton}


user is able to see booking is successful a message with details of the registered booking
    [Documentation]     to verify booking is successful by seeing "car model is now ready for pickup date"
    [Tags]        VG_test
    Wait Until Element Is Visible       ${successfulBooking}




user is able to see home button
    [Documentation]     to verify booking is successful by seeing home button
    [Tags]        VG_test
    Wait Until Element Is Visible       ${homeButton}




user clicks on my page
    [Documentation]     to be able to go to my page
    [Tags]        VG_test
    Click Button       //div[@id='backToStart']//button[@id='mypage']


user is able to see license of the booked car
    [Documentation]     to verify booking is successful by seeing license of the car row wise (1st row)
    [Tags]        VG_test
    Wait Until Element Is Visible       ${licenseNoRow1}

    
user is able to see cancel booking button
    [Documentation]     to see cancel button to verify that booking is done successfuly
    [Tags]        VG_test
    Wait Until Element Is Visible    ${cancelCar}


