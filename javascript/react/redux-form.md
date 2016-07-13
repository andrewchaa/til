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
