# Copy a folder to output directory

```xml
<ItemGroup>
  <None Update="Scripts\**">
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
  </None>
</ItemGroup>

```
