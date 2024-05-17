Feature:


  Background:
   # * url 'https://dev-xtables.thedigitalgroup.com'
    * url baseUrl
    * configure ssl = true
    * def workbook =  call read('InsertWorkbook.feature')
    * def c_Id1 = workbook.Id
    * def testcookie = workbook.testCooke


  Scenario:Update Sheet

    Given path '/elasticsearch/sheet/insertDoc'
    * header Accept = 'application/json'
    * header Cookie =  testcookie
    And request {"index":"sheet","doc":{"name":"#(randomSheetName)","title":"Random title","workbook_id":"#(c_Id1)","user_email":"amandeep.chauhan@thedigitalgroup.com","user_id":"amandeep.chauhan@thedigitalgroup.com","description":"A new sheet's description","notes":"","attachments":[],"sheetType":"default","sheet_identifier":"5e712257-93a3-460c-b75c-87fef6205dd8","columns":[{"columnElasticid":"2c18f8eb-04d2-4592-b835-5bb1b2beb5e4_es","width":"300","description":"A new column's description updated","colId":"#","field":"#","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"pinned":"left","sort":null,"sortIndex":null,"rowDrag":true},{"columnElasticid":"c3ffc3de-f1ac-4161-afb6-7e2ccc5c0d9a_es","width":"300","description":"A new column's description updated","colId":"ag-Grid-AutoColumn","field":"primaryCol","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Primary Column","suppressMovable":true,"lockPosition":true},{"columnElasticid":"160baf0d-6386-492f-94e1-5098be9bbee3_es","width":"300","description":"A new column's description updated","colId":"Column 1","field":"Column1","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 1"},{"columnElasticid":"a515bea4-1e45-48ce-9961-7f721a8223be_es","width":"300","description":"A new column's description updated","colId":"Column 2","field":"Column2","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 2"},{"columnElasticid":"cef8c6df-0214-4b85-a76f-e3d9bdb60604_es","width":"300","description":"A new column's description updated","colId":"Column 3","field":"Column3","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 3"},{"columnElasticid":"01f818d7-03c5-4cee-823a-f93704753c8f_es","width":"300","description":"A new column's description updated","colId":"Column 4","field":"Column4","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 4"},{"columnElasticid":"8011c620-17f0-4040-81f9-51774726df41_es","width":"300","description":"A new column's description updated","colId":"Column 5","field":"Column5","enableValue":true,"enableRowGroup":true,"groupDefaultExpanded":1,"filter":true,"editable":true,"wrapText":true,"resizable":true,"autoHeaderHeight":true,"wrapHeaderText":true,"rowGroup":false,"rowGroupIndex":null,"pivot":false,"pivotIndex":null,"aggFunc":null,"sort":null,"sortIndex":null,"headerName":"Column 5"}],"Rows":{"user_id":"amandeep.chauhan@thedigitalgroup.com","user_email":"amandeep.chauhan@thedigitalgroup.com","remote_datasource":"Elastic","attachments":[],"notes":"Notes example"}}}
    When method Post
    Then status 201
    And print response
    * def SheetID = response._id
    * print SheetID
    #InsertSheet

      #UpdateSheet
    Given path '/elasticsearch/sheet/insertDoc'
    * header Accept = 'application/json'
    * header Cookie =  testcookie
    * request {"index":"sheet","id":"#(SheetID)","doc":{"name":"#(randomSheetName)"}}
    When method Post
    Then status 201
    And print response