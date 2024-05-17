Feature: Xspace test
# @author Akshay

  Background:
   # * url 'https://dev-xtables.thedigitalgroup.com'
    * url baseUrl
    * configure ssl = true
    * def result = { "username":"amandeep.chauhan@thedigitalgroup.com", "password":"tdg@1234" }
    * def utility = Java.type('Utils.Internal.RandomDataUtility')
    * def randomName = utility.getRandomFirstName()
    * def randomNumber = utility.getRandomNumber(2)
    * print randomNumber
    * def random = "Workbook" + (randomNumber)
    * def randomSheetName = "Sheet" + (randomNumber)
    * print random
    * print randomName
    * path '/auth/getToken'
    * request result
    * method POST
    * status 201
    * print response
    * def testCooke = response.replace('"','').replace('"','')

  Scenario: Insert WorkBook
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


