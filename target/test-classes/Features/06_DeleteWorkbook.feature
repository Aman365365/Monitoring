Feature:

  Background:
    * url baseUrl
    * configure ssl = true
    * def workbook =  call read('InsertWorkbook.feature')
    * def c_Id1 = workbook.Id
    * def testcookie = workbook.testCooke

  Scenario: Delete Workbook
    Given path '/elasticsearch/workbook/delete'
    * header Accept = 'application/json'
    * header Cookie =  testcookie
    And request {"id":"#(c_Id1)"}
    When method PATCH
    Then status 200
    And print response
    #DeleteWorkbook
