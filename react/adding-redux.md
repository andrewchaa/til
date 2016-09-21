1. install dependencies
  
   ```
   npm i --save redux react-redux redux-logger redux-form
   ```

2. Add redux, reducer, store, etc ...

   ```javascript
    import { Provider } from 'react-redux';
    import { createStore, applyMiddleware, combineReducers, compose } from 'redux';
    import createLogger from 'redux-logger';
    import { reducer as formReducer } from 'redux-form';

    var rootReducer = combineReducers({
      form: formReducer
    });
    
    const loggerMiddleware = createLogger();
    
    let store = createStore(rootReducer, {},
      compose(applyMiddleware(loggerMiddleware), window.devToolsExtension ? window.devToolsExtension() : f => f)
    )
    
    ReactDOM.render(
      <Provider store={store}>
        <App />
      </Provider>,
      document.getElementById('root')
    );


   ```
