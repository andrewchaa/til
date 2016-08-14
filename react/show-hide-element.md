```javascript
 const SignIn = (props) => {
  return(
    <div className="row">
      { !props.userId ?
        <button onClick={props.signIn} id="sign-in-button"
         className="btn btn-default {props.userId ? 'userId' : '' }">
          <i className="glyphicon glyphicon-play"></i> Sign in with Google
        </button>
        :
        <button onClick={props.signOut} className="btn btn-default">
          <i className="glyphicon glyphicon-play"></i> Sign out
        </button>
      }
    </div>
  )
}

 
 {
   grantType.value !== 'client_credentials' &&
     <div className="form-group">
       <label for="username">Username: </label>
       <input type="text" className="form-control" id="username" />
     </div>
 }
 {
   grantType.value !== 'client_credentials' &&
     <div className="form-group">
       <label for="password">Password: </label>
       <input type="password" className="form-control" id="password" />
     </div>
 }
```
