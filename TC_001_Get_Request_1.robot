*** Settings ***
Library  RequestsLibrary

*** Variables ***
${Application_url}  http://www.thetestingworldapi.com

*** Test Cases ***
TC_001_Get_Request
    ${url}=  set variable  Hello
    log to console  ${Application_url}
    log to console  ${url}
