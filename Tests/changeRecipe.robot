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
    click link                           xpath://html/body/div/div/div/div/div[1]/a[2]
    wait until page contains             ReceptVäljaren
    click image                          xpath://html/body/div/div/div/collection-view/ul/li[2]/a/div/img
    wait until page contains             fisk
    click image                          xpath://html/body/div/div/div/collection-view/ul/li[2]/a/div/img
    wait until page contains             Chilifisk
    click element                        xpath://html/body/div/navigation-footer/div/div/right-side-buttons/div/a/img

When User want to change recipe
    sleep                                5
    click link                           xpath://html/body/div/navigation-footer/div/div/right-side-buttons/div/div/a[1]

Then System will show another recipe to add
    wait until page contains             ReceptVäljaren
    Page should contain                  ReceptVäljaren
End Web Test
     Close All Browsers
*** Test Cases ***

User can change recipe and add new recipe
      [Documentation]   This test is to change the recipe
      [Tags]            Change a recipe
        Given User on the Matglad page
        When User want to change recipe
        Then System will show another recipe to add
        End Web Test
