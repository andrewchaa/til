# Open a file in Rider from the terminal

You can [open a file in Rider from the terminal](https://www.jetbrains.com/help/rider/Opening_Files_from_Command_Line.html), optionally specifying where to put the caret after opening.

    rider --line <number> <path>
    
    # open a project
    $ rider ~/MyProject
    
    # open a specific file on line number 42
    $ rider --line 42 ~/MyProject/scripts/numbers.js

By default, Rider is not in the path. You can go to Tools > Create Command-line launcher


