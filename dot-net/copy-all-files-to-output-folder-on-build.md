# Copy all conetent files to output folder

By default, you can set each individual file to be copied to the output folder (usually `bin`), 
yet, you can [set the whole folder to be copied](https://rider-support.jetbrains.com/hc/en-us/community/posts/115000554064-Copy-to-Output-Copy-Folder-to-Output) by editing the `.csprojc` file. 

```
<ItemGroup>
  <None Update="appsettings.local.json">
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
  </None>
  <Content Include="Scripts\*">
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
  </Content>  
</ItemGroup>
```
