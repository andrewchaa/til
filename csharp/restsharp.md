### Request

    //get
    var client = new RestClient("https://api.gdax.com");
    var productId = "ETH-EUR";
    var request = new RestRequest($"/products/{productId}/candles");
    request.Method = Method.GET;
    var endDate = DateTime.Today;
    var startDate = endDate.AddYears(-1);
    request.AddUrlSegment("start", startDate.ToString("yyyy-MM-dd"));
    request.AddUrlSegment("end", endDate.ToString("yyyy-MM-dd"));
    request.AddUrlSegment("granularity", 216000);

    var response = await client.ExecuteTaskAsync(request);
    

    //post
    var client = new RestClient("../connect/");
    var request = new RestRequest("token", Method.POST);
    request.AddParameter("client_id", "ap");
    request.AddParameter("client_secret", "...");
    request.AddParameter("grant_type", "...");
    request.AddParameter("scope", "...");

    var response = client.Execute(request);
