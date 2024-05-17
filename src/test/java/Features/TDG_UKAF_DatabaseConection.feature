Feature: dogs end-point that uses jdbc as part of the test



  Scenario:

# use jdbc to validate
    * def config = { username: 'sql12343737', password: 'tZWFWH628v', url: 'jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12343737', driverClassName: 'com.mysql.cj.jdbc.Driver' }
    * def DbUtils = Java.type('Utils.External.DbUtils')
    * def db = new DbUtils(config)

# since the DbUtils returns a Java List (of Map-s), it becomes normal JSON here !
# which means that you can use the full power of Karate's 'match' syntax
    * def empolyees = db.readRows('Select * from office')
    Then print empolyees

    * def dogs = db.readRows('SELECT * FROM DOGS')
    * match dogs contains { ID: '#(id)', NAME: 'Scooby' }

    * def dog = db.readRow('SELECT * FROM DOGS D WHERE D.ID = ' + id)
    * match dog.NAME == 'Scooby'

    * def test = db.readValue('SELECT ID FROM DOGS D WHERE D.ID = ' + id)
    * match test == id

