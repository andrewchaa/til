# Typescript Domain Object 

```typescript
import { v4 as uuidv4 } from "uuid"
import { ContactUsData } from "../data/ContactUsData";
import { EventData } from "../data/EventData";
import { ContactUsRqeust } from "../requests/contactUsRequest";

export default class ContactUs {
  private _data: ContactUsData

  get EventData (): EventData<ContactUsData> {
    return <EventData<ContactUsData>> {
      id: this._data.id,
      name: "ContactUsFormSubmitted",
      data: this._data
    }
  }

  private constructor (
    id: string,
    firstname: string,
    lastname: string,
    email: string,
    company: string,
    phone: string,
    note: string,
    timePreference: string
  ) {

    this._data = {
      id,
      firstname,
      lastname,
      email,
      company,
      phone,
      note,
      timePreference
    }
  }

  static create(request: ContactUsRqeust): [string[], ContactUs] {

    const errors = []

    if (!request.firstname) errors.push("First name cannot be empty")
    if (!request.lastname) errors.push("Last name cannot be empty")
    if (!request.email) errors.push("Email cannot be empty")
    if (!request.note) errors.push("Note cannot be empty")

    if (errors.length > 0){
      return [errors, null]
    }

    return [[], new ContactUs(
      uuidv4(),
      request.firstname,
      request.lastname,
      request.email,
      request.company,
      request.phone,
      request.note,
      request.timePreference
    )]
  }
}

```
