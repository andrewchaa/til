# Convert string to different types in Go

## Numeric Conversions
The most common numeric conversions are Atoi (string to int) and Itoa (int to string).

```go
i, err := strconv.Atoi("-42")
s := strconv.Itoa(-42)
```

ParseBool, ParseFloat, ParseInt, and ParseUint convert strings to values:

```go
b, err := strconv.ParseBool("true")
f, err := strconv.ParseFloat("3.1415", 64)
i, err := strconv.ParseInt("-42", 10, 64)
u, err := strconv.ParseUint("42", 10, 64)
```
