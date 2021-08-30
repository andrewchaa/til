# Models for Primitive Types

* Value property to return the primitive value
* Overrided `ToString` for easy logging
* [Implicit conversion](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/user-defined-conversion-operators), so that the type can be used as if it's a primitive type


```csharp
public class StringValue
{
    public string Value { get; }

    public StringValue(string value)
    {
        Value = value;
    }

    public override string ToString()
    {
        return Value;
    }

    public static implicit operator string(StringValue valueType) => valueType.Value;
}

public class Email : StringValue
{
    public Email(string value) : base(value) { }
}

```
