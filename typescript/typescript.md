### Set up

    npm i -g typescript         // install typescript

### Concepts

![image](https://user-images.githubusercontent.com/840427/136653911-17446a56-7221-41e0-a6d8-63ca60e60c13.png)

![image](https://user-images.githubusercontent.com/840427/136654530-59ae889c-7cc8-4ada-9ebf-b1537663a5db.png)


### Basic

    let name: string = 'John'
    let names: string[] = ['John', 'Jack']
    
    function getName(firstname: string, lastname: string): string {
        return firstname + ' ' + lastname
    }
    
    class Persion {
        public hobby: string
        static numOfPersons: number = 0
        
        constructor(private name: string, private age: number) {
            Person.numOfPersions++;
        }
        
        info() {
            console.log(this.name + ' ' + this.age)
        }
    }
    
    // generic function
    const getType = function<T>(value: T): string {
        return typeof (T)
    }
    
    function driveVehicle<vehicle extends Vehicle>(v: Vehicle) {
        v.drive()
    }
    driveVehicle(car)
    driveVehicle(bike)
