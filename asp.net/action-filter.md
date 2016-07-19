```csharp
[AttributeUsage(AttributeTargets.Method)]
public class AntiBotAttribute : ActionFilterAttribute
{
    public override void OnActionExecuting(ActionExecutingContext context)
    {
        var reCaptchaValue = context.HttpContext.Request.Form["g-recaptcha-response"];
        if (reCaptchaValue == null || reCaptchaValue.Length > 0) return;

        var captchaFailed = reCaptchaValue == "";
        if (captchaFailed)
        {
            context.Result = new HttpStatusCodeResult(HttpStatusCode.Forbidden);
        }
    }
}
```
