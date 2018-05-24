# Copyright 2016-2017 VMware, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License

*** Settings ***
Documentation  This resource provides any keywords related to the Harbor private registry appliance
Resource  ../../resources/Util.robot

*** Variables ***
${HARBOR_VERSION}  v1.1.1

*** Keywords ***
Delete Success
    [Arguments]  @{obj}
    :For  ${obj}  in  @{obj}
    \    Page Should Contain Element  //clr-tab-content//div[contains(.,'${obj}')]/../div/clr-icon[@shape="success-standard"]
    Sleep  1

Delete Fail
    [Arguments]  @{obj}
    :For  ${obj}  in  @{obj}
    \    Page Should Contain Element  //clr-tab-content//div[contains(.,'${obj}')]/../div/clr-icon[@shape="error-standard"]
    Sleep  1

Filter Object
#Filter project repo user tag.
    [Arguments]    ${kw}
    Click Element  xpath=//hbr-filter//clr-icon
    Input Text   xpath=//hbr-filter//input  ${kw}
    Sleep  1

Select Object
#select single element such as user project repo tag
    [Arguments]    ${obj}
    Click Element  //clr-dg-row[contains(.,'${obj}')]//label

Multi-delete Object
    [Arguments]    @{obj}
    :For  ${obj}  in  @{obj}
    \    Click Element  //clr-dg-row[contains(.,'${obj}')]//label
    Sleep  1
    Click Element  //button[contains(.,'Delete')]
    Sleep  2
    Click Element  //clr-modal//button[contains(.,'DELETE')]
    Sleep  3

Multi-delete Member 
    [Arguments]    @{obj}
    :For  ${obj}  in  @{obj}
    \    Click Element  //clr-dg-row[contains(.,'${obj}')]//label
    Sleep  1
    Click Element  //button[contains(.,'REMOVE')]
    Sleep  2
    Click Element  //clr-modal//button[contains(.,'DELETE')]
    Sleep  3

Multi-delete Object Without Confirmation
    [Arguments]    @{obj}
    :For  ${obj}  in  @{obj}
    \    Click Element  //clr-dg-row[contains(.,'${obj}')]//label
    Sleep  1
    Click Element  //button[contains(.,'Delete')]
    Sleep  3

Select All On Current Page Object
    Click Element  //div[@class='datagrid-head']//label
