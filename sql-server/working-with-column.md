# Working with column

## Adding a column

```sql
ALTER TABLE Companies ADD BuyerCompany_EnableBidOnLedgerTrade bit NOT NULL DEFAULT 1
```

## Alter column type

```sql
ALTER TABLE InvestorRelationsUserGroups ALTER COLUMN UserId uniqueidentifier NOT NULL
```
