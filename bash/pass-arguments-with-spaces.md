# Pass arguments with spaces to a shell script function

https://unix.stackexchange.com/questions/151807/how-to-pass-argument-with-spaces-to-a-shell-script-function

You should just quote the second argument.

```
myfunc(){
        echo "$1"
        echo "$2"
        echo "$3"
}

myfunc hi "hello guys" bye
```
