function fn() {
  var env = karate.env;
  var os  = karate.os;
  var android = {}
  var ios = {}

  var config = {

  		baseUrl : "https://dev-xspaces.thedigitalgroup.com"

  	};

	 android["desiredConfig"] = {
         "app" : '/Users/app-stage-release.apk',
         "newCommandTimeout" : 1000,
         "platformVersion"  : "9.0",
         "platformName" : "Android",
         "connectHardwareKeyboard" : true,
         "deviceName" : "emulator-5554",
         "automationName" : "UiAutomator2"
          };


	karate.log('The value of env is : ', env);


      ios["desiredConfig"] = {
     "app" : '/Users/TCBRetail.apk',
     "newCommandTimeout" : 1000,
     "platformVersion"  : "16.4",
     "platformName" : "ios",
     "connectHardwareKeyboard" : true,
     "deviceName" : "iPhone 14 Pro MAX",
     "automationName" : "XCUITest",
     "udid" : "Abbjdbsjkbfjskbfjkajkbdfkbkadsbfk"
      };

     if (!env) env = 'dev';
      var config = { env: env }
	if(env == 'qa'){

		config.baseUrl = "https://dev-xspaces.thedigitalgroup.com"

	} else if(env == 'dev')
	{
		config.baseUrl = "https://dev-xspaces.thedigitalgroup.com"
	}else
	{
		config.baseUrl = "https://dev-xspaces.thedigitalgroup.com"
	}

    config["android"] = android
    config["ios"] = ios

	//karate.configure('connectTimeout', 6000);
	//karate.configure('readTimeout', 6000);

	return config;
}
