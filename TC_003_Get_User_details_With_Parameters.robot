*** Settings ***
Library  RequestsLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${Base_url}  https://reqres.in
${student_id}   1107447

*** Test Cases ***
TC_001_Get_User_details_by_Parameters
    create session  Get_User_Details    ${Base_url}
    &{param}  create dictionary  page=2

    ${response}  GET On Session  Get_User_Details   api/users/      params=${param}

    log to console  ${response.status_code}
    ${actual_code}  convert to string  ${response.status_code}
    should be equal  ${actual_code}    200

    log to console  ${response.content}

    ${json_response}    to json  ${response.content}
    @{first_name_list}  get value from json  ${json_response}  data[0].first_name
    ${first_name}  get from list   ${first_name_list}  0
    log to console  ${first_name}
    should be equal  ${first_name}  Michael