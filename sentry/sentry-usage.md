# Sentry usage

    # capturing errors
    try {
      aFunctionThatMightFail()
    } catch (err) {
      Sentry.captureException(err)
    }
    
    # capturing messages
    Sentry.captureMessage("Something went wrong");
