*** Settings ***
Library  RequestsLibrary

*** Variables ***
${Base_url}  http://www.thetestingworldapi.com/

*** Test Cases ***
TC_001_Get_Request
    create session  Get_Strudent_Details    ${Base_url}
    ${response}  GET On Session  Get_Strudent_Details   api/studentsDetails
    log to console  ${response}
    log to console  ${response.status_code}
    log to console  ${response.content}