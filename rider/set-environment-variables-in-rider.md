# Set environment variables in Rider

In Mac OS, you have to set openssl libarary to use AesGcm cryto library in `~/.zshrc`

    export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/openssl@1.1/1.1.1k/lib" # ARM
    export DYLD_LIBRARY_PATH="/usr/local/opt/openssl@1.1/lib"              # Intel

You set it in `~/.zshrc` but Rider may not pick it up in Run and in Unit test.

To configure the environment variables for Unit Tests

* Go to Preferences
* Navigate to Build, Execution and Deploy 
* Unit Testing
* Test Runner
* Set the environment variables

To configure the variables for `Run`, 

* Go to Run
* Edit Configurations



