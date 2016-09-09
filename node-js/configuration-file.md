```javascript

// config.js
exports.load = () => {
  process.env.logInEmail = "";
  process.env.logInPassword = "";
  process.env.apiKey = "";
  process.env.authDomain = "";
  process.env.databaseURL = "";
  process.env.storageBucket = "";
  process.env.twilioSid = "";
  process.env.twilioToken = "";
}

//notification.js
if (!process.env.production) {
  console.log('local environment, loading config settings');
  require('../config').load();
}


```
