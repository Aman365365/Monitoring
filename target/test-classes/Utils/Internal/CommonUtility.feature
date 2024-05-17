Feature: Date



  # @author Akshay


Scenario: Current Date
* def getDate =
  """
  function() {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat('yyyy/MM/dd');
    var date = new java.util.Date();
    return sdf.format(date);
  } 
  """

* def temp = getDate()
* print temp



Scenario: Current timeStamp

* def randomnum = 
"""
function(){ return java.util.UUID.randomUUID() + '' }

"""
* def temp = randomnum()
* print temp



Scenario: Current timeStamp

* def getCurrentTimeStamp = 
"""
function(){ return new Date().getTime(); }

"""
* def temp = getCurrentTimeStamp()
* print temp



Scenario: Random Num

* def random_num = 
"""
function(max){ return Math.floor(Math.random() * max) }

"""
* def temp = random_num(10000)
* print temp









Scenario: Random String


* def random_string =
      """
      	function(s){
      		var text = "";
      		var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      		for(var i=0; i<s; i++)
      			text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      			return text;
      	}
      """
    * def randomString = random_string(10)
    * print randomString
    
    
    
Scenario: Replace Value 
    
    * def text = 'hello <one> world <two> bye'

* replace text
  | token | value   |
  | one   | 'cruel' |
  | two   | 'good'  |

* match text == 'hello cruel world good bye'


  Scenario: Random Num

    * def random_num =
"""
function(max){ return Math.floor( max) }

"""
    * def temp = random_num(10)
    * print temp


