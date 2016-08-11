import React, { PropTypes, Component } from 'react';
import { connect } from 'react-redux';
import AppointmentForm from './AppointmentForm';

class App extends Component {
  onAuthStateChanged() {
    console.log('test');
  }

  componentDidMount() {
    firebase.auth().onAuthStateChanged(this.onAuthStateChanged);
  }

  handleClick() {
    var provider = new firebase.auth.GoogleAuthProvider();
    firebase.auth().signInWithPopup(provider);
  }

  render() {

    return (
      <div>
        <AppointmentForm {...this.props} />
        <section id="page-splash">
          <h3 className="logo">Database Web Quickstart</h3>
          <div>
            <button onClick={this.handleClick} id="sign-in-button" className="btn btn-default">
              <i className="glyphicon glyphicon-play"></i> Sign in with Google
            </button>
            <button onClick={this.props.testFunction}>Test</button>
          </div>
        </section>

      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    appointmentDate: state.appointmentDate
  };
}

const mapDispatchToProps = function(dispatch) {
  return {
    // testFunction: () => console.log('test')
    testFunction: function() {
      console.log('test');
      dispatch({type: 'test'})
    }
  }
}

App = connect(mapStateToProps, mapDispatchToProps)(App)



export default App;
