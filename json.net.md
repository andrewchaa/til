    // serialize enum to string
    [JsonConverter(typeof(StringEnumConverter))]
    public ActionType Type { get; set; }

    // exclude property from serialization
    [JsonIgnore]
    public IList<AggregateEvent> AggregateEvents { get; } = new List<AggregateEvent>();
