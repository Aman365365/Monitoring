Feature: Test demo API
# @author Akshay

  Background:
    * configure ssl = true
    #  * url 'https://dev-xtables.thedigitalgroup.com'
    * url baseUrl
    * def utility = Java.type('Utils.Internal.RandomDataUtility')
    * def randomName = utility.getRandomFirstName()
    * def randomNumber = utility.getRandomNumber(2)
    * print randomNumber
    * def random = "Workbook" + (randomNumber)
    * print random
    * print randomName
    * def testData = Java.type('Utils.External.UtilsMethods')

    * def excelFilePath =  ".\\src\\test\\java\\Data\\workbook.xlsx";
    * def payload = testData.readExcelData("Sheet1", excelFilePath)
    * def jsonpath = ".\\src\\test\\java\\Data\\Datatemplete.json"
    * def payl  = testData.readJsonTemplate(jsonpath)
    * def load = testData.createJsonTemplate(payl,payload)
    * print payl
    * print load
   # * print load[rowindex]
    #* def lo = load[rowindex]
    * print payload


  @setup
  Scenario:
    * def data =
    """
    function(i){
      if (i == 2) return null;
      return { rowindex: i };
    }
    """

  Scenario Outline: Run a sample POST API
    * path '/auth/getToken'
    * request load[rowindex]
    * method POST
    * status 201
    * print response
    * def testCooke = response.replace('"','').replace('"','')

    Given path '/elasticsearch/insertDoc'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"index":"workbook","doc":{"name":"#(random)","user_id":"amandeep.chauhan@thedigitalgroup.com","user_email":"amandeep.chauhan@thedigitalgroup.com","shared_with":[],"remote_datasource":"Elastic"}}
    When method post
    Then status 201
    And print response
    * def Id = response._id
    * print Id


    Given path '/elasticsearch/update'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"index":"workbook","id":"#(Id)","doc":{"name":"#(randomName)"}}
    When method PATCH
    Then status 200
    And print response

    Given path '/elasticsearch/workbook/delete'
    * header Accept = 'application/json'
    * header Cookie =  testCooke
    And request {"id":"#(Id)"}
    When method PATCH
    Then status 200
    And print response

    Examples:
      | karate.setup().data |


