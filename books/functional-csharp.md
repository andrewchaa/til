### designing function signatures and types

    // f takes an int and yields a string
    f : int → string
    
    (string, (IDbConnection → R)) → R
    Func<string, Func<IDbConnection, R>, R>
    
    // constraing input wity custom type
    public class Age {
       public int Value { get; }
       public Age(int value)
       {
          if (!IsValid(value))
             throw new ArgumentException($"{value} is not a valid age");

          Value = value;
       }

       private static bool IsValid(int age) => 0 <= age && age < 120;
    }
    
    // for comparision
    public static bool operator <(Age l, Age r) => l.Value < r.Value;
    public static bool operator >(Age l, Age r) => l.Value > r.Value;
    public static bool operator >(Age l, int r) => l > new Age(r);
    public static bool operator <(Age l, int r) => l < new Age(r);
    
