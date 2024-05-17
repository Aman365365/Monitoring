Feature: Xspace test
# @author Akshay

  Background:
  #  * url 'https://dev-xtables.thedigitalgroup.com'
    * url baseUrl
    * configure ssl = true
    * def result = { "username":"aman.chauhan@thedigitalgroup.com", "password":"tcb@1234" }
    * def utility = Java.type('Utils.Internal.RandomDataUtility')
    * def randomName = utility.getRandomFirstName()
    * def randomNumber = utility.getRandomNumber(2)
    * print randomNumber
    * def random = "Workbook" + (randomNumber)
    * print random
    * print randomName

    @Perf
  Scenario: Insert WorkBook
    * path '/auth/getToken'
    * request result
    * method POST
    * status 201
    * print response
    * def testCooke = response.replace('"','').replace('"','')
     * karate.pause(20)

      #Insert WorkBook
    Given path '/elasticsearch/insertDoc'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"index":"workbook","doc":{"name":"#(random)","user_id":"amandeep.chauhan@thedigitalgroup.com","user_email":"amandeep.chauhan@thedigitalgroup.com","shared_with":[],"remote_datasource":"Elastic"}}
    When method post
    Then status 201
    And print response
    * def Id = response._id
    * print Id
      * karate.pause(20)

      #Update workbook
    Given path '/elasticsearch/update'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"index":"workbook","id":"#(Id)","doc":{"name":"#(randomName)"}}
    When method PATCH
    Then status 200
    And print response
      * karate.pause(20)

      #InsertSheet
      Given path '/elasticsearch/sheet/insertDoc'
      * header Accept = 'application/json'
      * header Cookie =  testCooke
      And request {"index":"sheet","doc":{"name":"Sheet (1)","title":"Random title","workbook_id":"#(Id)","user_email":"amandeep.chauhan@thedigitalgroup.com","user_id":"amandeep.chauhan@thedigitalgroup.com","description":"A new sheet's description","notes":"","attachments":[],"sheetType":"default","sheet_identifier":"5e712257-93a3-460c-b75c-87fef6205dd8","columns":[{"columnElasticid":"2c18f8eb-04d2-4592-b835-5bb1b2beb5e4_es","width":"300","description":"A new column's description updated","colId":"#","field":"#","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"pinned":"left","sort":null,"sortIndex":null,"rowDrag":true},{"columnElasticid":"c3ffc3de-f1ac-4161-afb6-7e2ccc5c0d9a_es","width":"300","description":"A new column's description updated","colId":"ag-Grid-AutoColumn","field":"primaryCol","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Primary Column","suppressMovable":true,"lockPosition":true},{"columnElasticid":"160baf0d-6386-492f-94e1-5098be9bbee3_es","width":"300","description":"A new column's description updated","colId":"Column 1","field":"Column1","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 1"},{"columnElasticid":"a515bea4-1e45-48ce-9961-7f721a8223be_es","width":"300","description":"A new column's description updated","colId":"Column 2","field":"Column2","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 2"},{"columnElasticid":"cef8c6df-0214-4b85-a76f-e3d9bdb60604_es","width":"300","description":"A new column's description updated","colId":"Column 3","field":"Column3","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 3"},{"columnElasticid":"01f818d7-03c5-4cee-823a-f93704753c8f_es","width":"300","description":"A new column's description updated","colId":"Column 4","field":"Column4","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 4"},{"columnElasticid":"8011c620-17f0-4040-81f9-51774726df41_es","width":"300","description":"A new column's description updated","colId":"Column 5","field":"Column5","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 5"}],"Rows":{"user_id":"amandeep.chauhan@thedigitalgroup.com","user_email":"amandeep.chauhan@thedigitalgroup.com","remote_datasource":"Elastic","attachments":[],"notes":"Notes example"}}}
      When method Post
      Then status 201
      And print response
      * def SheetID = response._id
      * print SheetID
      * karate.pause(20)



   #DeleteWorkbook
    Given path '/elasticsearch/workbook/delete'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"id":"#(Id)"}
    When method PATCH
    Then status 200
    And print response
      * karate.pause(20)

