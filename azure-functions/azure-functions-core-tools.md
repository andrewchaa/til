# Azure Functions core Tools

To install 

    brew tap azure/functions
    brew install azure-functions-core-tools@3

to Run functional locally

    func start
    
    # deploy project files
    func azure functionapp publish <function-app-name>
    
    # kill the func process
    Port 7071 is unavailable. Close the process using that port, or specify another port using --port [-p].
    
    ps aux | grep func
    killall -9 func

