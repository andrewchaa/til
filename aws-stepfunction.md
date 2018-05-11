```javascript
// with choice, skip the steps not necessary

"CheckingIfEndDateExists": {
  "Type": "Choice",
  "Choices": [{
      "Variable": "$.StartOnly",
      "BooleanEquals": true,
      "Next": "CompleteState"
    }],
  "Default": "WaitingToEndScheduleEvent"
},
"CompleteState": {
  "Type": "Succeed"
}


```
