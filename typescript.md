### Set up

    npm i -g typescript         // install typescript

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
