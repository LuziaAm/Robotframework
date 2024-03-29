***Settings***
Resource       base.robot

Test Setup     Nova sessão   
Test Teardown  Encerra sessão

***Test Cases***

Login com sucesso
    Go To                               ${url}/login
    Login With                          stark  jarvis!

    Should See Logged User         Tony Stark
Senha Invalida
    [Tags]                                login_error
    Go To                                 ${url}/login
    Login With                            stark  test

    Should Contain Login Alert            Senha é invalida!

Usuario não existe
    [Tags]              login_error404
    Go To               ${url}/login
    Login With          test  test1

    Should Contain Login Alert                     O usuário informado não está cadastrado!

***Keywords***

Login With
    [Arguments]         ${uname}       ${pass}
    Input Text          css:input[name=username]            ${uname}
    Input Text          css:input[name=password]            ${pass}
    Click Element       class:btn-login

Should Contain Login Alert
    [Arguments]     ${result_mensagem}

    ${mensagem}=        Get WebElement      id:flash
    Should Contain      ${mensagem.text}    ${result_mensagem}

Should See Logged User
    [Arguments]     ${full_name}

    Page Should Contain     Olá, ${full_name}. Você acessou a área logada!

