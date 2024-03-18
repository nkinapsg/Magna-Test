*** Settings ***
Library   OperatingSystem
Library   SeleniumLibrary
Library   Collections
Library   JSONLibrary
Library   RequestsLibrary

Resource    ../resources/methods.robot

*** Test Cases ***
1.As a user I want to log in to a website So that I can access my account information
    [Tags]    RunAll
    Given I am on the website homepage
    When I click on the "Sign In" button
    And enter my username and password
    Then I should be logged in successfully
 
*** Test Cases ***
2.As a customer I want to complete a purchase on a website So that I can receive the product
    [Tags]    RunAll
    Given I am on the amazon website homepage
    When I click on the "Shop" button
    And I select a product to purchase
    And I add the product to my cart
    And I click on the "Checkout" button
    And I enter my shipping and payment information
    And I click on the "Place Order" button
    Then I should see a confirmation message that my order has been placed successfully
    
