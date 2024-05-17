Feature: Xspace test


  Background:
    * url baseUrl
    * configure ssl = true
    * def result = { "username":"amandeep.chauhan@thedigitalgroup.com", "password":"tdg@1234" }
    #* def workbook =  call read('InsertWorkbook.feature')
   # * def testcookie = workbook.testCooke
    * path '/auth/getToken'
    * request result
    * method POST
    * status 201
    * print response
    * def testCooke = response.replace('"','').replace('"','')

  Scenario: HomePage

    Given path '/notification/getNotifications/'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"recipient_id":"amandeep.chauhan@thedigitalgroup.com"}
    When method POST
    Then status 201
    And print response
    #GetNotifications
    Given path '/access/getAccessInfo/'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"recipient_id":"amandeep.chauhan@thedigitalgroup.com"}
    When method POST
    Then status 201
    And print response
      #Workbook
    Given path '/elasticsearch/search'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"index":"workbook","field":"user_id","value":"amandeep.chauhan@thedigitalgroup.com"}
    When method POST
    Then status 201
    And print response
    * def c_workbookid = response[0]._id
    * print c_workbookid
    #SearchByWorkbookId
    Given path '/elasticsearch/sheet/searchByWorkbookId'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"index":"sheet","workbook_id":"#(c_workbookid)"}
    When method POST
    Then status 201
    And print response

