Feature: Xspace test


  Background:
   # * url 'https://dev-xtables.thedigitalgroup.com'
    * url baseUrl
    * configure ssl = true
    * def workbook =  call read('InsertWorkbook.feature')
    * def c_Id1 = workbook.Id
    * def testcookie = workbook.testCooke



  Scenario: Insert WorkBook

    Given path '/elasticsearch/sheet/searchByWorkbookId'
    * header Accept = 'application/json'
    * header Cookie =  testcookie
    And request {"index":"sheet","workbook_id":"#(c_Id1)"}
    When method POST
    Then status 201
    And print response
   #SearchByWorkbookId

    #Insert WorkBook
    Given path '/elasticsearch/sheet/insertDoc'
    * header Accept = 'application/json'
    * header Cookie =  testcookie
    And request {"index":"sheet","doc":{"name":"Sheet (1)","title":"Random title","workbook_id":"#(c_Id1)","user_email":"amandeep.chauhan@thedigitalgroup.com","user_id":"amandeep.chauhan@thedigitalgroup.com","description":"A new sheet's description","notes":"","attachments":[],"sheetType":"default","sheet_identifier":"76980cac-79cc-46d3-a8a3-0639ccf50350","columns":[{"columnElasticid":"c394bcfb-2ae7-448a-8cdc-bf7c83b6b92a_es","width":"300","description":"A new column's description updated","colId":"#","field":"#","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"pinned":"left","sort":null,"sortIndex":null,"rowDrag":true},{"columnElasticid":"2c408908-612d-4dee-ac21-638f8f6bf5a0_es","width":"300","description":"A new column's description updated","colId":"ag-Grid-AutoColumn","field":"primaryCol","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Primary Column","suppressMovable":true,"lockPosition":true},{"columnElasticid":"1446be65-6fbc-44eb-8106-55e28aa47d66_es","width":"300","description":"A new column's description updated","colId":"Column 1","field":"Column1","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 1"},{"columnElasticid":"3e9f8cee-e619-4a4a-b0ac-8f32af59ad8e_es","width":"300","description":"A new column's description updated","colId":"Column 2","field":"Column2","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 2"},{"columnElasticid":"2888cebe-490a-4dc4-8a6b-7371f0aa5d4c_es","width":"300","description":"A new column's description updated","colId":"Column 3","field":"Column3","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 3"},{"columnElasticid":"bcdb9c9a-4015-4fb2-9eb9-0ea29cf25d6e_es","width":"300","description":"A new column's description updated","colId":"Column 4","field":"Column4","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 4"},{"columnElasticid":"adc83f72-04d5-4b37-bc5c-88705b99c320_es","width":"300","description":"A new column's description updated","colId":"Column 5","field":"Column5","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 5"}],"Rows":{"user_id":"amandeep.chauhan@thedigitalgroup.com","user_email":"amandeep.chauhan@thedigitalgroup.com","remote_datasource":"Elastic","attachments":[],"notes":"Notes example"}}}
    When method post
    Then status 201
    And print response


    #SearchBySheetId
    Given path '/elasticsearch/sheetrow/searchBySheetId'
    * header Accept = 'application/json'
    * header Cookie =  testcookie
    And request {"index":"sheetrow","user_id":"amandeep.chauhan@thedigitalgroup.com","sheet_id":"76980cac-79cc-46d3-a8a3-0639ccf50350"}
    When method POST
    Then status 201
    And print response

