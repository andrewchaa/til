# Mock functions

## mock package module

Create __mocks__ directory in the root project and create a file `react-native-device-info.js`

Put in the file the following

```javascript
# react-native-device-info.js
export default { getIPAddress: () => {}, }
```

## Mock module and verify the given parameter

```javascript
import { handler } from './index'
import { ddbDocClient } from '../services/dynamodbClient'

ddbDocClient.send = jest.fn()

test('should successfully save all details', async () => {
  const ev = {
    arguments: {
        userId: 'testUserId',
        registrationId: 'testRegistrationId',
        serialNumber: '123456789012345',
        model: 'testModel',
        installationDate: 'testInstallationDate',
        firstName: 'testFirstName',
        lastName: 'testLastName',
        contactNo: 'testContactNo',
        emailAddress: 'emailAddress',
        door: 'testDoor',
        street: 'testStreet',
        city: 'testCity',
        county: 'testCounty',
        postcode: 'testPostcode',
        postCode: 'testPostCode',
        registrationDate: 'testRegistrationDate',
        registrationDateIso: 'testRegistrationDateIso',
        updateDateIso: 'testUpdateDateIso',
        warrantyDate: 'testWarrantyDate',
        warrantyYear: 'testWarrantyYear',
    }
  }
  await handler(ev)

  const parameter = (ddbDocClient.send as jest.Mock).mock.calls[0][0].input.Item
  expect(parameter.userId).toBe('testUserId')
  expect(parameter.registrationId).toBe('testRegistrationId')
  expect(parameter.serialNumber).toBe('123456789012345')
  expect(parameter.model).toBe('testModel')
  expect(parameter.installationDate).toBe('testInstallationDate')
  expect(parameter.firstName).toBe('testFirstName')
  expect(parameter.lastName).toBe('testLastName')
  expect(parameter.contactNo).toBe('testContactNo')
  expect(parameter.emailAddress).toBe('testEmailAddress')
  expect(parameter.door).toBe('testDoor')
  expect(parameter.street).toBe('testStreet')
  expect(parameter.city).toBe('testCity')
  expect(parameter.county).toBe('testCounty')
  expect(parameter.postcode).toBe('TESTPOSTCODE')
  expect(parameter.postCode).toBe('TESTPOSTCODE')
  expect(parameter.registrationDate).toBe('17/06/2022')
  expect(parameter.registrationDateIso).toBe('2022-06-17')
  expect(parameter.updateDateIso).toBe('2022-06-17')
  expect(parameter.warrantyDate).toBe('testWarrantyDate')
  expect(parameter.warrantyYear).toBe('testWarrantyYear')
})

```
