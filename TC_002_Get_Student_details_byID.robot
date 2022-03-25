*** Settings ***
Library  RequestsLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${Base_url}  http://www.thetestingworldapi.com/
${student_id}   1107447

*** Test Cases ***
TC_001_Get_Student_details_by_Id
    create session  Get_Student_Details    ${Base_url}
    ${response}  GET On Session  Get_Student_Details   api/studentsDetails/${student_id}
    log to console  ${response}
    log to console  ${response.status_code}
    ${actual_code}  convert to string  ${response.status_code}
    should be equal  ${actual_code}    200
    log to console  ${response.content}
    ${json_response}    to json  ${response.content}
    @{first_name_list}  get value from json  ${json_response}  data.first_name
    ${first_name}  get from list   ${first_name_list}  0
    log to console  ${first_name}
    should be equal  ${first_name}  moma