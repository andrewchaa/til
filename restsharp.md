### Request

    //get
    

    //post
    var client = new RestClient("../connect/");
    var request = new RestRequest("token", Method.POST);
    request.AddParameter("client_id", "ap");
    request.AddParameter("client_secret", "...");
    request.AddParameter("grant_type", "...");
    request.AddParameter("scope", "...");

    var response = client.Execute(request);
