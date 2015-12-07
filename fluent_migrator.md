##### Index

```csharp
Delete.Index("_dta_index_Bids_5_1429580131__K2_K1_K14_K3_4_5_6_7_8_9_10_11_12_13_15").OnTable("Bids");

Create.Index("index_Bids_UserId_BidId_AuctionId_IsWinning").OnTable("Bids")
    .OnColumn("UserId").Ascending()
    .OnColumn("BidId").Ascending()
    .OnColumn("AuctionId").Ascending()
    .OnColumn("IsWinning").Ascending()
    .WithOptions()
    .NonClustered();

```

#####  Change column type

```csharp
Alter.Table("Bids").AlterColumn("PercentNotional").AsDecimal().Nullable();
```
