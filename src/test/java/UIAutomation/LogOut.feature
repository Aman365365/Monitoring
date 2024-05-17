  Feature: LogOut Functionality
   @LogOut
   Scenario: Successful logout
   When click(logout.SandwitchButton)
   Then click(logout.logOutButton)
   Then waitForUrl('https://www.saucedemo.com/')
   * driver.close()