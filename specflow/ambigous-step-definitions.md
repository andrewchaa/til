* from https://stackoverflow.com/questions/25433031/specflow-test-step-inheritance-causes-ambiguous-step-definitions
* Don't include the [Binding] attribute on the base class
* Create a derived class for each feature file
* Add the [Binding] attribute to the derived class (will automatically include all step definitions in the base class)
* Add a [Scope] attribute to the derived class; specify the name of the feature for the named parameter Feature

```csharp
[Binding]
[Scope(Feature = "Delivery Prices Within PostCodes")]
public sealed class DeliveryPricesSteps
{

```
