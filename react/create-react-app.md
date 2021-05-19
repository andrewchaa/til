**Resources**

* https://github.com/facebookincubator/create-react-app

1. Install dependencies
   
   ```
   npm i -g create-react-app
   ```
   
   Install google cloud sdk: https://cloud.google.com/sdk/docs/quickstart-mac-os-x

2. create the app and start it

   ```
   create-react-app clinic-appointments
   npm start
   ```

3. deploy

   ```
   npm run build
   gcloud app deploy
   ```

**Import CSS**

```javascript
import 'react-datepicker/dist/react-datepicker.css';
```
