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
    
    // honest / dishonest function
    Risk CalculateRiskProfile(Age age) => (age < 60) ? Risk.Low : Risk.Medium;
    
    Risk CalculateRiskProfile(int age)
    {
       if (age < 0 || 120 <= age)
          throw new ArgumentException($"{age} is not a valid age");

       return (age < 60) ? Risk.Low : Risk.Medium;
    }

    // unit: representation of no return type in functional way

    // functor
    Map : (C<T>, (T → R)) → C<R>

### Designing programs with function composition

    // composition
    h = f · g
    h(x) = (f · g)(x) = f(g(x))
    
    Pure— If your function has side effects, it’s less reusable.
    Chainable— A this argument (implicit on instance methods and explicit on extension methods) makes it possible to compose through chaining.
    General— The more specific the function, the fewer cases there will be where it’s useful to compose it.
    Shape-preserving— The function preserves the “shape” of the structure; so, if it takes an IEnumerable, it returns an IEnumerable, and so on.

### Functional error handling

    // Either type, which, in the context of an operation with two possible outcomes, captures details about the outcome that has taken place. 
    By convention, the two possible outcomes are indicated with Left and Right (as shown in figure 6.1), likening the Either-producing operation to a fork: things can go one way or another.
    
    Option<T>	None	Some(T)
    Either<L, R>	Left(L)	Right(R)

