*** Setting ***
Documentation                           This is some basic infor about the whole test suite
Library                                 SeleniumLibrary
Test Setup                              Open browser                 ${URL}    ${BROWSER}
Test Teardown                           End Web Test
*** Variables ***
${BROWSER}                              chrome
${URL}                                  http://app.matglad.nu/#/startview/
*** Keywords ***
Given User on the Matglad page
    set selenium speed                   1
    Wait until Page Contains             Matglad
    click element                        xpath://html/body/div/div/div/div/div[1]/a[3]
    wait until page contains             Veckomatsedel
    click element                        xpath://html/body/div/div/div/div/div[8]/img


When User wants to add recipe
    sleep                                5
    click image                          xpath://html/body/div/div/div/div/div[4]/div[2]/img
    sleep                                2
    wait until page contains             Välj recept
    Click Element                        xpath://html/body/div/div/div/div[2]/div/div/span/div/div/div[1]/h3
    wait until page contains             Välj recept
    Click Element                        xpath://html/body/div/div/div/div[2]/div/div/div[2]/div/collection-view/ul/li[2]/a/div/img
    wait until page contains             Välj recept
    Page should contain                  fisk
    click image                          xpath://html/body/div/div/div/div[2]/div/div/div[2]/div/collection-view/ul/li[3]/a/div/img
    wait until page contains             Välj recept
    Page should contain                  Stekt fisk med klyftpotatis
    click image                          xpath://html/body/div/div/div/div[2]/div/div/div[2]/div/img
    wait until page contains             Välj recept
    click element                        xpath://html/body/div/div/div/div[2]/div/div/span/div/img
    wait until page contains             Veckomatsedel
    Page should contain                  Veckomatsedel

And User wants to change recipe
    click image                          xpath://html/body/div/div/div/div/div[4]/div[2]/img
    wait until page contains             Välj recept
    Page should contain                  Stekt fisk med klyftpotatis
    click element                        xpath://html/body/div/div/div/div[2]/div/div/span/div/div/div[1]/h3
    wait until page contains             Välj recept
    click element                        xpath://html/body/div/div/div/div[2]/div/div/span/div/div/div[1]/h3
    wait until page contains             Välj recept
    click image                          xpath://html/body/div/div/div/div[2]/div/div/div[2]/div/collection-view/ul/li[1]/a/div/img
    wait until page contains             Välj recept
    Page should contain                  Soppa
    click image                          xpath://html/body/div/div/div/div[2]/div/div/div[2]/div/collection-view/ul/li[1]/a/div/img
    wait until page contains             Välj recept
    click element                        xpath://html/body/div/div/div/div[2]/div/div/span/div/img
    wait until page contains             Veckomatsedel
    Page should contain                  Veckomatsedel


Then System shows the new recipe is added
    wait until page contains             Veckomatsedel

End Web Test
    Close All Browsers
*** Test Cases ***

User can change recipe and add new recipe
      [Documentation]   This test is to change the recipe
      [Tags]            Change a recipe
        Given User on the Matglad page
        When User wants to add recipe
        And User wants to change recipe
        Then System shows the new recipe is added
        End Web Test

#User can delete recipe in Matglad application
      #[Documentation]   This test is to delete the recipe
      #[Tags]            Delete a recipe
        #Given User on the Matglad page
        #When User want to delete recipe already chosen before for that particular day
       # And The system will pop up a error message whether are you sure to delete
        #Then  The System will delete that recipe that you do not want to
        #End Web Test


