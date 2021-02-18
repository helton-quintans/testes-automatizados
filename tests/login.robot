***Settings***
Documentation       Testes da página de login

Library             Browser     #é a portabilidade do framework de test da Playwright(framework node p/ automação de testes concorrente do Cypress)
                                # para Robot Framework

Resource            resources/login_actions.robot
Test Teardown       Take Screenshot

***Variables***
${url}              https://parodify.herokuapp.com

***Test Cases***
Login com Sucesso
    New Page                   https://parodify.herokuapp.com/users/sign_in
    #Open Browser                ${url}/users/sign_in        chromium
    #Get Text                    label[for=user_email]       contains       Email
    #Fill Text                   css=input[name*=email]      papito@parodify.com     # ou id=user_email
    #Fill Text                   css=#user_password          pwd123
    #Click                       css=input[type=submit]      #or css=input[value='Log in']
    Login With                  papito@parodify.com         pwd123
    Get Element State           css=a[href$=sing_out]       visible
    #Wait For Elements State     css=a[href$=sing_out]
    Sleep                       3
    #Take Screenshot             Login com Sucesso           true        #robotframework-browser- scree nshot- {login}

Senha Incorreta
    New Page                    https://parodify.herokuapp.com/users/sign_in
    #Open Browser                ${url}/users/sign_in        chromium
    Login With                  papito@parodify.com          404abc 
    Get Text                    css=.is-danger .message-body        ==      Opps! Dados de acesso incorretos!             
    Sleep                       3              
    
Email não Existe
    New Page                   https://parodify.herokuapp.com/users/sign_in
    #Open Browser                ${url}/users/sign_in        chromium
    Login With                  ${EMPTY}          404abc
    Get Text                    css=.is-danger .message-body        ==      Opps! Dados de acesso incorretos!
    Sleep                       3
    
Email não Informado
    New Page                   https://parodify.herokuapp.com/users/sign_in
    #Open Browser                ${url}/users/sign_in        chromium
    Login With                  ${EMPTY}          404abc 
    Get Text                    css=.is-danger .message-body        ==      Opps! Dados de acesso incorretos!
    Sleep                       3               

Senha não Informada
    New Page                   https://parodify.herokuapp.com/users/sign_in
    #Open Browser                ${url}/users/sign_in        chromium
    Login With                  papito@parodify.com          ${EMPTY}
    Get Text                    css=.is-danger .message-body        ==      Opps! Dados de acesso incorretos!
    Sleep                       3   

