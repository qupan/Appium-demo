*** Settings ***
Library           AppiumLibrary    timeout=30
Library           DateTime
Library           Collections
Library           String
Library           XML
Library           OperatingSystem
Library           BuiltIn
Library           String
Library           Process
Library           Dialogs
Library           Screenshot
Library           Telnet
Library           RequestsLibrary
Library           AutoItLibrary
Library           ExcelLibrary

*** Keywords ***
等待元素出现
    [Arguments]    ${locator}
    wait until page contains element    ${locator}    30    page not contains element
    Wait Until Element Is Visible    ${locator}    30    element is not visible

打开app
    [Arguments]    ${version}    ${devicename}    ${package}    ${activity}
    Append To Environment Variable    PATH    /usr/local/bin
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=${version}    deviceName=${devicename}    appPackage=${package}    appActivity=${activity}

关闭所有app
    [Documentation]    关闭浏览器
    Close All Applications

点击元素
    [Arguments]    ${locator}
    [Documentation]    点击元素。
    ...    参数${locator}：是定位 方式 例如：id=kw
    等待元素出现    ${locator}
    BuiltIn.Wait Until Keyword Succeeds    30 s    2 s    click element    ${locator}

输入文本
    [Arguments]    ${locator}    ${text}
    [Documentation]    参数${locator}：是定位 方式，例如：id=kw；
    ...    ${text}是输入的文本；
    等待元素出现    ${locator}
    BuiltIn.Wait Until Keyword Succeeds    30 s    2 s    Clear Text    ${locator}
    BuiltIn.Wait Until Keyword Succeeds    30 s    2 s    input text    ${locator}    ${text}

滑动
    [Arguments]    ${start_x }    ${start_y }    ${offset_x }    ${offset_y }    ${locator}
    等待元素出现    ${locator}
    Swipe    ${start_x }    ${start_y }    ${offset_x }    ${offset_y }

得到宽和高
    ${height}    Get Window Height
    ${width}    Get Window Width
    @{widow}    create list    ${width}    ${height}
    [Return]    @{widow}
