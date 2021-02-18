***Keywords***
Login With
    [Arguments]                 ${email_arg}                ${pass_arg}

    Fill Text                   css=input[name*=email]      ${email_arg}
    Fill Text                   css=#user_password          ${pass_arg}
    Click                       css=input[type=submit]