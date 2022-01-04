# ID class to avoid primitive obsession

It's important to avoid primitive id type such as string and int, as they do not distinguish one id from another. 
For example, customerId 1 will be treated the same as productId 1. ID class can solve this problem by wrapping the value 
with custom class like CustomerId and ProductId.

```csharp
public class OrderId : StringIdBase
{
    public OrderId(string value) : base(value) { }
}


public class StringIdBase
{
    public string Value { get; }
    public bool IsEmpty => string.IsNullOrWhiteSpace(Value);

    public StringIdBase(string value)
    {
        Value = value;
    }

    public static implicit operator string(StringIdBase stringId) => stringId.Value;

    public override string ToString()
    {
        return Value;
    }

    protected bool Equals(StringIdBase other)
    {
        return Value == other.Value;
    }

    public override bool Equals(object obj)
    {
        if (ReferenceEquals(null, obj))
        {
            return false;
        }

        if (ReferenceEquals(this, obj))
        {
            return true;
        }

        if (obj.GetType() != this.GetType())
        {
            return false;
        }

        return Equals((StringIdBase)obj);
    }

    public override int GetHashCode()
    {
        return (Value != null ? Value.GetHashCode() : 0);
    }
}

```
