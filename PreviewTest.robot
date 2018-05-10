*** Settings ***
Library           ExtendedSelenium2Library
Resource          DataFiles/LoginPageData.txt
Library           DateTime
Library           ExcelLibrary
Resource          DataFiles/EncounterFormCustomData.txt
Resource          ElementLocators/HomePageElementLocators.txt
Resource          ElementLocators/HomePageElementLocators.txt
Resource          ElementLocators/LoginPageElementLocators.txt
Resource          Keywords/EncounterFormKeywords.txt
Resource          Keywords/HomePageKeywords.txt
Resource          Keywords/LoginPageKeywords.txt

*** Test Cases ***
LoginTest_ValidCredentials
    [Documentation]    TestCase to verify login into the application using Valid Credentials.Test sync
    ...
    ...    Dependencies:
    ...    Keywords -> LoginPageKeywords.
    ...    DataFiles -> LoginPageData.txt
    ...
    ...    1) Invokes LaunchApp Keyword form LoginPageKeywords to load the browser with the URL.
    ...    2) Sets the Test Variable ${User} and ${Pass} parsing from the Command Line Arguments.
    ...    3) Executes Login Keyword from LoginPageKeywords.txt to login into the application.
    ...
    LaunchApp
    Set Test Variable    ${User}
    Set Test Variable    ${Pass}
    Login    ${User}    ${Pass}
    log    Executing Login method

HomepageTest
    [Documentation]    TestCase to check all the HomePage elements.
    ...
    ...    Dependencies:
    ...    Keywords -> HomePageKeywords.
    ...    DataFiles -> HomePageData.txt
    ...
    ...    1) Invoke ToggleNavigation keyword from HomePageKeywords.txt to check the functionality is working fine.
    ...    2) Invoke Search for Patients keyword from HomePageKeywords.txt which recieves a parameter ${SearchName} obtained from HomePageData.txt to verify the search functionality.
    ...    3) Invoke IDCRHelpCenter keyword from HomePageKeywords.txt which verifies all the links avaialble for Help.
    ...    4) Click on New Encounter button by invoking ClickNewEncounterButton keyword from HomePageKeywords.txt
    ...
    ToggleNavigation
    SearchForPatients    ${SearchName}
    IDCRHelpCenter
    ClickNewEncounterButton

NewEncounterForm_StandardCreationTest
    CloseNewEncounterForm
    ClickNewEncounterButton
    FillNewEncounterForm
    CloseNewEncounterForm
    GoBackOnCloseFormWindow
    CloseNewEncounterForm
    CloseWithoutSavingOnCloseFormWindow
