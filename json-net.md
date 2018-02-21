    // serialize enum to string
    [JsonConverter(typeof(StringEnumConverter))]
    public ActionType Type { get; set; }
