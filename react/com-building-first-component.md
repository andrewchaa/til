```javascript
var App = React.createClass({
  render: function(){
    return(React.createElement("div", null, "Welcome to Adequate, Mike!"));
  }
});

React.render(React.createElement(App), document.body);

// with JSX
var App = React.createClass({
  render: function(){
    return <div>
     Hello, from Shawn!
    </div>;
  }
});

React.render(React.createElement(App), document.body);
```
