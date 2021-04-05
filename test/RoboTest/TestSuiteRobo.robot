*** Settings ***
Library   SeleniumLibrary   

Test Setup    Open Browser    https://duckduckgo.com    chrome
Test Teardown    Close Browser 

Default Tags   sanity 

*** Variables ***
@{ROBOTS}=    Bender    Terminator    HAL    R2D2    C3PO 
@{Flashback}=    BoiBoiElashBoi    nEzU659Tw&jqX9-
*** comment ***
Different variables: 
SCALAR - ${name_of_Scalar_variable} (tab) value_of_variable(string or number)
List - @{variable_name} (tab) item1 (tab) item2, ...
Choose a specific element in list ${variable_name}[index] starts from 0 ($ instead of @ since it's singular)
Dictionary - &{vairable_name} (tab) K1=V1 (tab) K2=V2 ......
Environment - %{enironment_credentials} like the username of this computer and operating system
For example %{username} => Jeffe %{os} => windows

Tags:
Default tag - places a tag on all test cases
[Tags] - Places a tag on the specific test case, which overrides the default tag
Set Tags - Places a tag on the specific test case, does not override the default tag
Remove Tags - Removes the specific tag

Setup/Teardown:
Test setup - Does this at the start of the test (only once)
Test teardown - does this at the end of the test (only once)
Test suite setup - does this at the start of a testcase, one per testcase
Test suite teardown - does this at the end of a testcase, one per testcase

Keywords - works as functions!

How to run robot test cases from CMD
first get the directory of the project, right click project->properties->copy the directory
Go to directory in cmd
write "robot -t (testcasename) (folder\suitename.robot
for example: robot -t FirstSeleniumTest RoboTest\TestSuiteRobo.robot
If you want to set tags through the cmd : 
robot -t FirstSeleniumTest --settags=TagName RoboTest\TestSuiteRobo.robot
Run only a testcase with a tag
for example: robot --include Sele RoboTest\TestSuiteRobo.robot
Run multiple testcases with tags
for example: robot -i sanity -i Sele RoboTest\TestSuiteRobo.robot
Run testcases starting with a letter
for example: robot -i s* RoboTest\TestSuiteRobo.robot
=>Sanity tags run, Sele tag run, Smoke tag run
Can do the same but exclude the tags with the command -e or --exclude
You can use include and exclude in the same command

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello 1   
    
MySecondTest
    Log    Hello2    

MyThirdTest
    Log    Hello3    
    
MyFourhtTest
    Log    Fourth Hello    
FirstSeleniumTest
    [Tags]    Sele
    Set Browser Implicit Wait    50
    Input Text    name=q    flashback 
    Set Browser Implicit Wait    50   
    Click Button    S     
    Sleep    2   
    Click Link    https://www.flashback.org     
    Sleep    4
    LoginKW 
    Sleep    10    

*** Keywords ***
LoginKW
    Click Element    xpath://*[@id="navbar-top-menu"]/ul/li[2]/a[1]
    Sleep    2    
    Input Text    name=vb_login_username    ${Flashback}[0]
    Input Text    name=vb_login_password    ${Flashback}[1]  
    Press Keys    name=vb_login_password    RETURN
    