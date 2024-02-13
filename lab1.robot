#Skapa ett testfall som testar navigations-flödet av att boka en bil.
#Testet skall navigera från start-sida, logga in på ett redan existerande konto, boka en bil.
#• Testsviten skall testa minst två olika sidor/funktioner
#• Utgå från kravdokumentationen och koppla varje testfall till en dokumenterad sida/funktion.
#Använd [Tags] och [Documentation] i Robot Framework samt namnge testfallen så att de
#beskriver vad som testas.
#• Åtminstone ett testfall bör skrivas i DDT-format.
#• Minst två negativa testfal



*** Settings ***

#user:deebarf@gmail.com
#password: infotiv2024

Documentation    ovning-4
Library    SeleniumLibrary
Library    Collections
Library     XML
Suite Setup     setup


*** Variables ***

${url}      https://rental13.infotiv.net/
${infotivCarRental}   //h1[@id='title']
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
#${}        //input[@id='phone']
#@{}=    Create List
#@{}=    Create List
#@{}=    Create List



#follwing are customer details
${inputName}        Deba
${inputLastName}        Arif
${createUser}       //button[@id='createUser']
${inputPhoneNumber}        004612335678
${input-E-mail}        deebarf20243@gmail.com
${inputPassword}        infotiv2024


*** Keywords ***
setup
    Set Selenium Speed    1    #used to control the speed
    Open Browser    browser=Chrome
    Go To   ${url}


*** Test Cases ***
check if website opens
    [Documentation]     check if website is open correctly by waiting to see infotiv car rental
    [Tags]      verify website is correct
    
    Wait Until Element Is Visible    ${infotivCarRental}

    IF    "$PREV TEST STATUS =='PASS'"
        Log    website status: website opened successfuly
    ELSE
        Log    List eqaulity status: website could not be opened
    END


click on creat customer profile
    [Documentation]     click on create customer and make sure its on correct page
    [Tags]      creating customer

    Click Button    ${createUser}

    Wait Until Element Is Visible    ${createNewUser}



fill customer details on create customer page
    [Documentation]     filling customer details
    [Tags]

    Input Text      ${firstName}      ${inputName}
    Input Text      ${lastName}       ${inputLastName}
    Input Text      ${phoneNumber}       ${inputPhoneNumber}
    Input Text      ${E-mail}       ${input-E-mail}
    Input Text      ${confirm-E-mail}       ${input-E-mail}
    Input Password     ${password}      ${inputPassword}
    Input Password     ${confirmPassword}      ${inputPassword}
    Click Button    ${createButton}
    #Wait Until Page Contains    ${whatWouldYouLikeToDrive} #this does not match when is done automatically and manually











