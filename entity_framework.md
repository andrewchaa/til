# Mapping

## Table name

```csharp
[Table("Claims")]
public class IdentityClaim
{
    [Key]
    public int Id { get; set; }
    public string Name { get; set; }
    public int ScopeId { get; set; }
    public virtual IdentityScope Scope { get; set; }
}
```

## Relationships

### One to many

```chsarp
[Table("Claims")]
public class IdentityClaim
{
    [Key]
    public int Id { get; set; }
    public string Name { get; set; }
    public int ScopeId { get; set; }
    public virtual IdentityScope Scope { get; set; }
}

[Table("Scopes")]
public class IdentityScope
{
    public IdentityScope()
    {
        Claims = new List<IdentityClaim>();
    }

    [Key]
    public int Id { get; set; }
    public string Name { get; set; }
    public string DisplayName { get; set; }
    public string Description { get; set; }
    public ScopeType ScopeType { get; set; }
    public bool Enabled { get; set; }
    public virtual ICollection<IdentityClaim> Claims { get; set; }
}

```

# Errors

Asking for CREATE permission

```csharp
public IdentityDbContext() : base("name=IdentityDbContext")
{
    Database.SetInitializer<IdentityDbContext>(null);
} 

```
