Feature: Xspace test
# @author Akshay

  Background:
    #  * url 'https://dev-xtables.thedigitalgroup.com'
    * url baseUrl
    * configure ssl = true
    * def utility = Java.type('Utils.Internal.RandomDataUtility')
    * def randomName = utility.getRandomFirstName()
    * def randomNumber = utility.getRandomNumber(2)
    * print randomNumber
    * def random = "Workbook" + (randomNumber)
    * print random
    * print randomName

  @Perf
  Scenario Outline: Insert WorkBook
    * path '/auth/getToken'
    * request
    """
    {
    "username":<username>
    , "password":<password>
    }


    """
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
      |   read('classpath:Data/DataCsv.csv')  |
