# Set environment variables for unit test run in Rider

In Mac OS, you have to set openssl libarary to use AesGcm cryto library in `~/.zshrc`

In the same manner, you have to set it to run the code in unit test.

In Jetbrains Rider, Microsoft Visual Studio or any other IDE, make sure to set the DYLD_LIBRARY_PATH in both Unit Test and Run/Debug configurations.

To configure the environment variables used by Unit Tests in Rider, go to Preferences, and then navigate to Build, Execution and Deploy > Unit Testing > Test Runner.
