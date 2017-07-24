https://msdn.microsoft.com/en-us/library/bb397417.aspx

```csharp
void Application_Error(object sender, EventArgs e)
{
    var exc = Server.GetLastError();

    // Handle HTTP errors
    if (exc.GetType() == typeof(HttpException))
    {
        if (exc.Message.Contains("NoCatch") || exc.Message.Contains("maxUrlLength"))
            return;
    }

    _logger.ExtendedException(exc, "An unhandled application exception has happened", new { HttpContext.Current.Request.Url });
}

```
