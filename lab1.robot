#Skapa ett testfall som testar navigations-flödet av att boka en bil.
#Testet skall navigera från start-sida, logga in på ett redan existerande konto, boka en bil.
#• Testsviten skall testa minst två olika sidor/funktioner
#• Utgå från kravdokumentationen och koppla varje testfall till en dokumenterad sida/funktion.
#Använd [Tags] och [Documentation] i Robot Framework samt namnge testfallen så att de
#beskriver vad som testas.
#• Åtminstone ett testfall bör skrivas i DDT-format.
#• Minst två negativa testfal



*** Settings ***

Documentation    ovning-4
Library    SeleniumLibrary
Library    Collections
Library     XML
Suite Setup     setup


*** Variables ***
#${}
${infotivCarRental}   //h1[@id='title']
${createNewUser}        //h1[@id='questionText']
${createUser}       //button[@id='createUser']
${firstName}        //input[@id='name']
${lastName}        //input[@id='last']
#@{}=    Create List
#@{}=    Create List
#@{}=    Create List
${url}      https://rental13.infotiv.net/

#follwing are customer details
${inputName}        Deba
${inputLastName}        Arif
${createUser}       //button[@id='createUser']


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






