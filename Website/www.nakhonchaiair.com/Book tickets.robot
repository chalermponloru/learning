
*** Setting ***
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${URL}    https://www.nakhonchaiair.com/ncaweb/
${BROWSER}    Chrome
${ID_NUM}    1426841878013
${NAME_LNAME}    เฉลิมพล มาลาคำ
${TELNUMBER}    0812345678
${EMAIL}    chalermponmalakum@gmail.com


*** Keywords ***
Click Until Month Is August
    ${month}    Get Text    //div[@class="picker__month"]
    Run Keyword If    '${month}' != 'สิงหาคม'    Click Element    //div[@class="picker__nav--next"]
    Should Be Equal    ${month}    สิงหาคม

Click Until Page Changes
    Click Element    //button[contains(text(),'ถัดไป')]
    Wait Until Page Contains Element    //*[@id="dis-dptseat-4C"]    1s

*** Test Cases ***
001 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    //*[@id="load" and @style="display: none;"]
    Click Element    //button[@class="btn dropdown-toggle bs-placeholder form-control border ft-14" and @title='ต้นทาง' ]
    Click Element    //a[@id='bs-select-1-2']
    Wait Until Page Contains Element    //button[@data-id="pn_despoint"]
    Click Element    //button[@data-id="pn_despoint"]
    Click Element    //a[@id='bs-select-2-0']
    Click Element    //input[@id="pd_dptdate"]
    Wait Until Keyword Succeeds    10s    0.5s    Click Until Month Is August
    Click Element    //*[@id="pd_dptdate_1753981200000"]    ##01/08/2025
    Wait Until Page Contains Element    //input[@name="pd_rtndate"]
    Click Button    //input[@name="pd_rtndate"]
    Click Element    xpath=//*[@id="pd_rtndate_1755104400000"]    ##14/08/2025
    Click Element    //*[@id="frm-route"]/div/div[3]/div/div[1]/div/span[3]
    Click Button    //*[@id="frm-route"]/div/div[3]/div/div[2]/div/button    
    Wait Until Location Contains    https://ncabooking.nakhonchaiair.com/booking/timetable.php
    Location Should Be    https://ncabooking.nakhonchaiair.com/booking/timetable.php
    Wait Until Page Contains Element    //*[@id="secsion-dpt-3" and @data-leavetime="202508010900" and @data-arrivetime="202508011542"]
    Scroll Element Into View    //*[@id="secsion-dpt-3" and @data-leavetime="202508010900" and @data-arrivetime="202508011542"]
    Click Element   //*[@id="secsion-dpt-3" and @data-leavetime="202508010900" and @data-arrivetime="202508011542"]
    Scroll Element Into View    //button[contains(text(),'พ. 13 ส.ค.')]
    Click Button    //button[contains(text(),'พ. 13 ส.ค.')]
    Wait Until Element Is Visible    //*[@id="secsion-rtn-15" and @data-leavetime="202508131700" and @data-arrivetime="202508132335"]
    Scroll Element Into View    //*[@id="secsion-rtn-15" and @data-leavetime="202508131700" and @data-arrivetime="202508132335"]
    Click Element    //*[@id="secsion-rtn-15" and @data-leavetime="202508131700" and @data-arrivetime="202508132335"]
    Wait Until Page Contains Element    //div[@id='load' and @style='display: none;']
    Wait Until Element Is Visible    //*[@id="pn_typememberval-0"]    10s
    Input Text    //*[@id="pn_typememberval-0"]    ${ID_NUM}
    Capture Page Screenshot
    Click Element    //select[@id='pn_gender-0']//option[@value="ช"]
    Input Text    //*[@id="pc_passengername-0"]    ${NAME_LNAME}
    Input Text    //*[@id="pn_mobileno-0"]    ${TELNUMBER}
    Input Text    //*[@id="pc_email-0"]    ${EMAIL}
    Click Element    //*[@id="chek_copyinfo-1"]
    Click Element    //*[@id="invalidCheck"]
    Wait Until Keyword Succeeds    10s    1s    Click Until Page Changes
    Wait Until Page Contains Element    //div[@id='load' and @style='display: none;']
    Wait Until Element Is Visible    //*[@id="dis-dptseat-4C"]    10s
    Click Element    //*[@id="dis-dptseat-4C"]
    Click Element    //*[@id="dis-dptseat-4D"]
    Scroll Element Into View    //*[@id="frm-depart"]/div[2]/div/button[2]
    Click Button    //*[@id="frm-depart"]/div[2]/div/button[2]
    Wait Until Page Contains Element    //div[@id='load' and @style='display: none;']
    Wait Until Element Is Visible    //*[@id="dis-rtnseat-4C"]    10s
    Click Element    //*[@id="dis-rtnseat-4C"]
    Click Element    //*[@id="dis-rtnseat-4D"]
    Scroll Element Into View    //*[@id="frm-return"]/div[2]/div/button[2]
    Click Button    //*[@id="frm-return"]/div[2]/div/button[2]
    Wait Until Page Contains    สรุปราคาค่าโดยสารที่ต้องชำระ
    Capture Page Screenshot