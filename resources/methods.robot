*** Settings ***
Library  OperatingSystem
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Library  Dialogs

Resource     ../resources/variables.robot

*** Keywords ***
#SLEEP TIMES
Wait2 
    Sleep   2 Seconds
Wait10 
    Sleep   10 Seconds
Wait15
    Sleep   15 Seconds

#Loin PSGOnline methods
Given I am on the website homepage
    ${options}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}       add_argument   --disable-infobars
    Call Method         ${options}       add_argument   --disable-notifications
    Call Method         ${options}       add_argument   --disable-geolocation
    Call Method         ${options}       add_argument   --disable-extensions
    Call Method         ${options}       add_argument   --disable-popup-blocking
    Call Method         ${options}       add_argument   --disable-dev-shm-usage
    Call Method         ${options}       add_argument   --no-sandbox  
    Call Method         ${options}       add_argument   --disable-setuid-sandbox
    Call Method         ${options}       add_argument   --disable-gpu
    Call Method         ${options}       add_argument   --disable-infobars
    Open Browser       ${SiteUrlEdx}        ${Browser}        ${options} 
    Maximize Browser Window
    Wait15


When I click on the "Sign In" button
    click enabled and visible button ${ButtonSignInEdx}
    Wait2

And enter my username and password
    input text field ${UsernameFieldEdx} AND ${UsernameEdx}
    input text field ${PasswordFieldEdx} AND ${PasswordEdx}
    Wait2

Then I should be logged in successfully
    click enabled and visible button ${ButtonLoginEdx}
    Wait2
    Capture Page Screenshot
    Log To Console    \nLog In Successful 
    Close Browser  

Given I am on the amazon website homepage
    ${options}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}       add_argument   --disable-infobars
    Call Method         ${options}       add_argument   --disable-notifications
    Call Method         ${options}       add_argument   --disable-geolocation
    Call Method         ${options}       add_argument   --disable-extensions
    Call Method         ${options}       add_argument   --disable-popup-blocking
    Call Method         ${options}       add_argument   --disable-dev-shm-usage
    Call Method         ${options}       add_argument   --no-sandbox  
    Call Method         ${options}       add_argument   --disable-setuid-sandbox
    Call Method         ${options}       add_argument   --disable-gpu
    Call Method         ${options}       add_argument   --disable-infobars
    Open Browser       ${SiteUrlSauceDemo}        ${Browser}        ${options} 
    Maximize Browser Window
    Wait15  
    click enabled and visible button ${SignInButtonSauceDemo}   
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${UsernameFieldSauceDemo}
    input text field ${UsernameFieldSauceDemo} AND ${UsernameSauceDemo}
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${PasswordFieldSauceDemo}
    input text field ${PasswordFieldSauceDemo} AND ${PasswordSauceDemo}
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${SignInButtonSauceDemo}
    click enabled and visible button ${SignInButtonSauceDemo}
    Wait2

When I click on the "Shop" button
    click enabled and visible button ${BackPackSauceDemo}
    wait2

And I select a product to purchase   
    click enabled and visible button ${BackPackSauceDemo} 
    Wait2
    

And I add the product to my cart
    click enabled and visible button ${AddToCartButtonSauceDemo} 
    Wait2

And I click on the "Checkout" button 
    click enabled and visible button ${GoToCartSauceDemo}
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${CheckOutButtonSauceDemo}
    click enabled and visible button ${CheckOutButtonSauceDemo} 
    Wait2

And I enter my shipping and payment information
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${InputNameField}
    input text field ${InputNameField} AND ${InputNameSauceDemo} 
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${InputLastField}
    input text field ${InputLastField} AND ${InputLastSauceDemo}  
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${ZipCodeFieldSauceDemo}
    input text field ${ZipCodeFieldSauceDemo} AND ${ZipCodeSauceDemo} 
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${ContinuesButton}
    click enabled and visible button ${ContinuesButton}
    Wait2 

And I click on the "Place Order" button
    click enabled and visible button ${FinishButton}  
    Wait2

Then I should see a confirmation message that my order has been placed successfully
    Wait2
    Capture Page Screenshot
    Wait2
    Log To Console    \nOrder Placed Successful  
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${BackHomeButton}
    click enabled and visible button ${BackHomeButton} 
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${MenuButton}
    click enabled and visible button ${MenuButton} 
    Wait Until Keyword Succeeds    1 min	30000ms    Wait Until Element Is Visible         ${LogoutButton}
    click enabled and visible button ${LogoutButton} 
    Wait2
    Close Browser


#######################################INPUT TEXT METHOD#################################################
input text field ${element} AND ${inputText}
    ${count}=    Set Variable    0
    ${status}=    Set Variable     False
    WHILE    '${status}' == 'False'
        ${count}=    Evaluate    ${count} + 1
        ${tempstatus}=   Run Keyword And Return Status     Wait Until Element Is Visible    ${element}
        ${tempstatus}=    Convert To String    ${tempstatus}
        ${status}=    Evaluate    ${tempstatus}
        IF    ${count} >= 15
            Input Text        ${element}     ${inputText} 
            BREAK
        END
    END
    IF    '${status}' == 'True' 
        #TYPE INPUT
        Input Text        ${element}     ${inputText} 
    END

####################CLICK BUTTON METHOD###################
click enabled and visible button ${element}
    ${count}=    Set Variable    0
    ${status}=    Set Variable    False
    WHILE    '${status}' == 'False'
        ${count}=    Evaluate    ${count} + 1 
        ${isVisible}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${element} 
        ${isEnabled}=    Run Keyword And Return Status     Wait Until Element Is Enabled    ${element}
        IF    ${isEnabled} and ${isVisible}
            ${status}=    Evaluate    True
            Click Element    ${element}
            BREAK
        ELSE IF     ${count} >= 15
            Click Element          ${element}
            BREAK
        END

    END 





    

