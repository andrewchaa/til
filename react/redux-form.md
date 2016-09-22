**Resources**

* https://gist.github.com/insin/bbf116e8ea10ef38447b

**Getting Started**

* give reducer to Redux

```javascript
import { createStore, applyMiddleware, combineReducers, compose } from 'redux'
import { reducer as formReducer } from 'redux-form';

var reducers = {
  form: formReducer
};

var rootReducer = combineReducers(reducers);


var configureStore = function configureStore(initialState) {
    const store = createStore(rootReducer, initialState, compose(
        applyMiddleware(
            thunkMiddleware,
            loggerMiddleware
        ),
        window.devToolsExtension ? window.devToolsExtension() : f => f
    ));
    return store;
};

render(
    <Provider store={configureStore()}>
        <TokenClientsContainer />
    </Provider>,
    document.getElementById('app')
);

```

* Decorate the form component with reduxForm()

```javascript
import React, {Component} from 'react';
import {reduxForm} from 'redux-form';

class ContactForm extends Component {
  render() {
    const {fields: {firstName, lastName, email}, handleSubmit} = this.props;
    return (
      <form onSubmit={handleSubmit}>
        <div>
          <label>First Name</label>
          <input type="text" placeholder="First Name" {...firstName}/>
        </div>
        <div>
          <label>Last Name</label>
          <input type="text" placeholder="Last Name" {...lastName}/>
        </div>
        <div>
          <label>Email</label>
          <input type="email" placeholder="Email" {...email}/>
        </div>
        <button type="submit">Submit</button>
      </form>
    );
  }
}

ContactForm = reduxForm({ // <----- THIS IS THE IMPORTANT PART!
  form: 'contact',                           // a unique name for this form
  fields: ['firstName', 'lastName', 'email'] // all the fields in your form
})(ContactForm);

export default ContactForm;
```

**initial values**

```javascript
class AppointmentForm extends Component {
  render() {

    const {fields: { patientName, mobile, clinic, appointmentDate, appointmentTime }, handleSubmit, submitting } = this.props;

    return (
      <form className="form-inline" onSubmit={handleSubmit(onSubmit)}>
        <div className="row">
          <input type="text" className="form-control" id="patientName" name="patientName" placeholder="name" {...patientName} />
          <input type="text" className="form-control" id="mobile" placeholder="mobile" {...mobile} />
          <select className="form-control" id="clinic" name="clinic" {...clinic}>
            value={clinic.value || ''}>
            <option>Equilibrium</option>
            <option>Harley Street</option>
          </select>
          <input type="text" className="form-control" id="appointmentDate" name="appointmentDate" {...appointmentDate} />
          <input type="text" className="form-control" id="appointmentTime" name="appointmentTime" {...appointmentTime} />
          <button type="submit" className="btn btn-default">Submit</button>
        </div>
      </form>
    );
  }
}

export default reduxForm({
    form: 'EntryForm',
    fields,
    validate
  },
  state => {
    const form = state.form.EntryForm;
    return ({ // mapStateToProps
      initialValues: {
        clinic: form ? form.clinic.value : 'Harley Street',
        userId: state.userId,
        date: form ? form.date.value : moment().format('DD/MM/YYYY'),
        hour: form ? form.hour.value: '9',
        minute: form ? form.minute.value: '00'
      }
    })
  },
  {
    // mapDispatchToProps
  }
)(EntryForm);

```
