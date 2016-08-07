```javascript
import 'react-datepicker/dist/react-datepicker.css';
import DatePicker from 'react-datepicker';
import moment from 'moment';

  <DatePicker {...appointmentDate}
    dateFormat='DD/MM/YYYY'
    selected={appointmentDate.value ? moment(appointmentDate.value) : null }
    className="form-control" />

```
