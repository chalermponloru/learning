*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${URL_CART}    https://www.saucedemo.com/cart.html
${BROWSER}    edge
${username}    standard_user
${password}    secret_sauce
${fname}    Test
${lname}    User


*** Test Cases ***
TC001 - Login ด้วยข้อมูลที่ถูกต้อง
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Element    id=login-button
    Page Should Contain    Products
    Capture Page Screenshot
    Close Browser

TC002 - Login ล้มเหลวจากข้อมูลผิด
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${username}
    Input Password    id=password    wrong_pass
    Click Element    id=login-button
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Capture Page Screenshot
    Close Browser

TC003 - เพิ่มสินค้า 1 ชิ้นในตะกร้า
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Element    id=login-button
    Page Should Contain    Products
    Click Element    id=add-to-cart-sauce-labs-bike-light
    Wait Until Element Contains    class=shopping_cart_badge    1
    Capture Page Screenshot
    

TC004 - ดำเนินการ Checkout
    Click Element    //a[@data-test='shopping-cart-link']
    Page Should Contain    Checkout
    Click Button    id=checkout
    Location Should Be    https://www.saucedemo.com/checkout-step-one.html
    Input Text    id=first-name    ${fname}
    Input Text    id=last-name    ${lname}
    Input Text    id=postal-code    10310
    Capture Page Screenshot
    Close Browser

TC005 - ลบสินค้าออกจากตะกร้า
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Element    id=login-button
    Page Should Contain    Products
    Capture Page Screenshot
    Click Button    Add to cart
    Click Button    Add to cart
    Click Button    Add to cart
    Click Button    Add to cart
    Click Button    Add to cart
    Click Button    Add to cart
    Capture Page Screenshot
    Click Button    Remove
    Click Button    Remove
    Click Button    Remove
    Click Button    Remove
    Click Button    Remove
    Click Button    Remove
    Capture Page Screenshot

TC006 - ตรวจสอบจำนวนสินค้าหลังเพิ่มหลายชิ้น
    Click Button    Add to cart
    Click Button    Add to cart
    Click Button    Add to cart
    Wait Until Element Contains    class=shopping_cart_badge    3
    Click Element    //a[@data-test='shopping-cart-link']
    Capture Page Screenshot
    Click Button    Remove
    Click Button    //button[@class="btn btn_secondary btn_small cart_button"]
    Wait Until Keyword Succeeds    10s    1s    Click Element    //button[@class="btn btn_secondary btn_small cart_button"]
    Capture Page Screenshot

TC007 - ตรวจสอบ Sorting: ราคาน้อยไปมาก
    Click Button    //button[@id="react-burger-menu-btn"]
    Wait Until Keyword Succeeds    10s    1s    Click Element    //a[@id='inventory_sidebar_link']
    Capture Page Screenshot
    Click Element    //select[@class="product_sort_container"]
    Wait Until Keyword Succeeds    10s    1s    Click Element   //option[@value="lohi"]

TC008 - Logout จากระบบ
    Click Button    //button[@id="react-burger-menu-btn"]
    Wait Until Keyword Succeeds    10s    1s    Click Element    //a[@id='logout_sidebar_link']
    Close Browser

TC009 - Checkout ไม่กรอกข้อมูล
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Element    id=login-button
    Click Element    //a[@data-test='shopping-cart-link']
    Click Button    //button[@id="checkout"]
    Click Button    //input[@id="continue"]
    Input Text    id=first-name    ${fname}
    Page Should Contain    Error
    Capture Page Screenshot

TC010 - เปิดดูรายละเอียดสินค้าจากหน้า Products
    Click Button    //button[@id="react-burger-menu-btn"]
    Wait Until Keyword Succeeds    10s    1s    Click Element    //a[@id='inventory_sidebar_link']
    Location Should Be    https://www.saucedemo.com/inventory.html
    Click Button    //button[@id="add-to-cart-sauce-labs-backpack"]
    Wait Until Element Contains    class=shopping_cart_badge    1
    Click Element    //a[@data-test='shopping-cart-link']
    Location Should Be    https://www.saucedemo.com/cart.html
    Page Should Contain    Sauce Labs Backpack
    Capture Page Screenshot
    Close Browser