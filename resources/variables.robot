*** Settings ***
Library   OperatingSystem
Library   SeleniumLibrary
Library   Collections
Library   JSONLibrary
Library   RequestsLibrary

*** Variables ***
#Edx Variables
${SiteUrlEdx}                                     https://authn.edx.org/register/
${Browser}                                        Chrome
${ButtonSignInEdx}                                xpath://a[normalize-space()='Sign in'][1]
${UsernameEdx}                                    nvero915@gmail.com    
${PasswordEdx}                                    Veronkie1!
 
#xpath variables: Login and Logout Methods
${UsernameFieldEdx}                               name:emailOrUsername
${PasswordFieldEdx}                               name:password
${ButtonLoginEdx}                                 xpath://span[contains(text(),'Sign in')][1]
${ButtonAccountID}                                xpath://html[1]/body[1]/div[1]/div[1]/div[1]/header[1]/div[2]/button[1]
${ButtonProfile}                                  xpath://a[normalize-space()='Profile'][1]
${ButtonLogoutEdx}                                xpath://html[1]/body[1]/form[1]/table[1]/tbody[1]/tr[1]/td[1]/input[1]

#xpath variables: Amazon Method
${UsernameSauceDemo}                              standard_user    
${PasswordSauceDemo}                              secret_sauce
${SiteUrlSauceDemo}                               https://www.saucedemo.com/
${UsernameFieldSauceDemo}                         xpath://input[@placeholder='Username'][1]
${PasswordFieldSauceDemo}                         xpath://input[@placeholder='Password'][1]
${SignInButtonSauceDemo}                          xpath://input[@name='login-button'][1]
${BackPackSauceDemo}                              xpath://div[normalize-space()='Sauce Labs Backpack'][1]
${AddToCartButtonSauceDemo}                       xpath://button[normalize-space()='Add to cart'][1]
${GoToCartSauceDemo}                              xpath://a[@class='shopping_cart_link'][1]
${CheckOutButtonSauceDemo}                        xpath://button[normalize-space()='Checkout'][1]
${InputNameField}                                 xpath://input[@placeholder='First Name'][1]
${InputNameSauceDemo}                             Nkina
${InputLastField}                                 xpath://input[@placeholder='Last Name'][1]
${InputLastSauceDemo}                             Ramonyai
${ZipCodeFieldSauceDemo}                          xpath://input[@placeholder='Zip/Postal Code'][1]
${ZipCodeSauceDemo}                               7530
${ContinuesButton}                                xpath://input[@name='continue'][1]
${FinishButton}                                   xpath://button[normalize-space()='Finish'][1]
${BackHomeButton}                                 xpath://button[normalize-space()='Back Home'][1]
${MenuButton}                                     xpath://button[normalize-space()='Open Menu'][1]
${MenuButton}                                     xpath://button[normalize-space()='Open Menu'][1]
${LogoutButton}                                   xpath://a[normalize-space()='Logout'][1]