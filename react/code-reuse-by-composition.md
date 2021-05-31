# Resuing code with composition

It's an accepted principal that you should [favour composition over inheritance](https://reactjs.org/docs/composition-vs-inheritance.html). 
React follows the same principle. 

```javascript
function FancyBorder(props) {
  return (
    <div className={'FancyBorder FancyBorder-' + props.color}>
      {props.children}
    </div>
  );
}

function WelcomeDialog() {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">
        Welcome
      </h1>
      <p className="Dialog-message">
        Thank you for visiting our spacecraft!
      </p>
    </FancyBorder>
  );
}
```

Often you have to pass all the props to the child component, regardless of the names.

```javascript
const IntermediateComponent = (props) => {
  return (
    <ChildComponent {...props} />
  )
}
```
