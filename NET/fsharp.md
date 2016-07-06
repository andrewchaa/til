##### reference a namespace
```fsharp
open System.IO
```


#### Directory

##### Getting a full path
```fsharp
let fullPath = Path.GetFullPath argv.[0]
```

##### combine paths
```fsharp
let packageFolder = Path.Combine [| fullPath; "packages" |]
```

#### loop
##### for in loop

```fsharp
for person in people do
    let entry = person.Split [|','|]
    let name = entry.[0]
    let age = entry.[1]

    classify name (int age)
```

#### Operators
##### Boolean
* not: negation
* ||: OR
* &&: AND

```fsharp
if String.IsNullOrEmpty(input) || String.IsNullOrWhiteSpace(input) then
    printfn "Please input name and age. ex. Joe, 13|Jane, 20"
```

#### string
##### Split

```fsharp
let people = input.Split [|'|'|]
for person in people do
    let entry = person.Split [|','|]
    let name = entry.[0]
    let age = entry.[1]

    classify name (int age)
```
