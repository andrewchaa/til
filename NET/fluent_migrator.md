# Getting started

Install package
```powershell
Install-Package FluentMigrator
```

**Create a new table**

```csharp
Create.Table(TableName)
    .WithColumn("QuoteId").AsInt32().PrimaryKey().NotNullable().Identity()
    .WithColumn("SCompanyId").AsInt32().NotNullable().ForeignKey("FK_EarlyQuote_Companies", "Companies", "CompanyId")
    .WithColumn("DCompanyId").AsInt32().NotNullable().ForeignKey("FK_Companies_DebtorCompanyId", "Companies", "CompanyId")
    .WithColumn("UserId").AsInt32().NotNullable().ForeignKey("FK_Users_UserId", "Users", "UserId")
    .WithColumn("Revenue").AsDecimal().NotNullable()
    .WithColumn("TimeToTrade").AsString().NotNullable()
    .WithColumn("DueDays").AsInt32().NotNullable()
    .WithColumn("TradeValue").AsDecimal().NotNullable()
    .WithColumn("Fee").AsDecimal().NotNullable()
    .WithColumn("FeePercent").AsDecimal().NotNullable()
    .WithColumn("Discount").AsDecimal().NotNullable()
    .WithColumn("CreatedOnUtc").AsDateTime().NotNullable();

```

# Index

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
