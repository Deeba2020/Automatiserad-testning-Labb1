#Skapa ett testfall som testar navigations-flödet av att boka en bil.
#Testet skall navigera från start-sida, logga in på ett redan existerande konto, boka en bil.
#• Testsviten skall testa minst två olika sidor/funktioner
#• Utgå från kravdokumentationen och koppla varje testfall till en dokumenterad sida/funktion.
#Använd [Tags] och [Documentation] i Robot Framework samt namnge testfallen så att de
#beskriver vad som testas.
#• Åtminstone ett testfall bör skrivas i DDT-format.
#• Minst två negativa testfal



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

#locator for renting car
${startMonth}       //input[@id='start']
${startDay}        //input[@id='start']
${endMonth}        //input[@id='end']
${endDay}        //input[@id='end']
${continueButton}       //button[@id='continue']
${whatWouldYouLikeToDrive}       //h1[@id='questionText']


#variables for renting car
${inputStartMonth}      03
${inputStartDay}        13
${inputEndMonth}        04
${inputEndDay}          13


*** Keywords ***
setup
    Set Selenium Speed    1    #used to control the speed
    Open Browser    browser=Chrome
    Go To   ${url}


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
    [Tags]

    #[Arguments]     ${input-E-mail}     ${inputPassword}
    Input Text      ${login-E-mail}       ${input-E-mail}
    Input Password     ${login-password}      ${inputPassword}

user clicks login button
    Click Button    ${loginButton}

#user is able to see a welcome message with the name of the user



rent car
   [Documentation]     renting car
   [Tags]

   Input Text      ${startMonth}       ${inputStartMonth}
   Input Text      ${startDay}        ${inputStartDay}

   Input Text      ${EndMonth}       ${inputEndMonth}
   Input Text      ${EndDay}        ${inputEndDay}
   
   Click Button    ${continueButton}
   
   Wait Until Element Is Visible    ${whatWouldYouLikeToDrive}






