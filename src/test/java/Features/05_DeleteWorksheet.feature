Feature:

  Background:
   # * url 'https://dev-xtables.thedigitalgroup.com'
    * url baseUrl
    * configure ssl = true
    * def sheet =  call read('04_UpdateWorksheet.feature')
    * def c_SheetId = sheet.SheetID
    * def testcookie1 = sheet.testcookie


  Scenario: Delete Sheet
    Given path '/elasticsearch/sheet/delete'
    * header Accept = 'application/json'
    * header Cookie =  testcookie1
    * request {"id":"#(c_SheetId)"}
    When method POST
    Then status 201
    And print response
    * def SheetID = response._id
    * print SheetID
    #DeleteSheet
