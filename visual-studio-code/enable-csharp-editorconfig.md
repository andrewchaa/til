## Enable .editorconfig in visual studio code

You can use Visual Studio (Windows), Rider (Mac / Linux), or Visual Studio Code (all platforms).

The solution has `.editorconfig' that specifies recommended C# coding styles. Visual Studio and Rider support the file out of the box.
In case of VS Code, you have to enable the support
* Install [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) extension
* Open the settings in VSCode and search for Omnisharp. In user settings, set `omnisharp.enableRoslynAnalyzers` to true
  ```json
  "omnisharp.enableRoslynAnalyzers": true,
  ```

* Then restart the VS Code so that Onmisharp server can restart.
