# Commit and push automatically on save

I use a simple txt file to write down everything I do. Not to lose the file, I commit it to github.
I do `gid add`, `git commit`, and `git push` everyday and soon it became a repetitive chore. 

So, I wrote down a simple typescript to automate. 
Simply it monitors the file change with `nodemon` and execute `push.ts` to push the change to the github automatically.

```typescript
const {exec} = require("child_process")

exec("git add -A", (err: { message: any; }, stdout: any, stderr: { message: any; }) => {
  if (err) {
    console.log(`error: ${err.message}`)
    return;
  }
  if (stderr) {
    console.log(`stderr: ${stderr.message}`)
    return;
  }
  console.log(stdout)

  exec("git commit -am \"worknote\"", (err: { message: any; }, stdout: any, stderr: { message: any; }) => {
    if (err) {
      console.log(`error: ${err.message}`)
      return;
    }
    if (stderr) {
      console.log(`stderr: ${stderr.message}`)
      return;
    }
    console.log(stdout)

    exec("git push", (err: { message: string; }, stdout: any, stderr: { message: string; }) => {
      if (err) {
        console.log(`error: ${err.message}`)
        return;
      }
      if (stderr) {
        console.log(`stderr: ${stderr.message}`)
        return;
      }

      console.log(stdout)
    })
  })

})
```

A few things to do

- [ ] Use promise. I don't like the 3 depth callbacks. 
- [ ] Error handling if any step fails
