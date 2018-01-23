    // map
    public static TResult Map<TSource, TResult>(this TSource @this, 
      Func<TSource, TResult> func
      ) => func(@this);
