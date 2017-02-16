# Alter

## Adding a column

```sql
ALTER TABLE Companies ADD BuyerCompany_EnableBidOnLedgerTrade bit NOT NULL DEFAULT 1
```

## Drop a column

```sql
ALTER TABLE InvestorRelationsUserGroups DROP COLUMN UserId
```

## Alter column type

```sql
ALTER TABLE InvestorRelationsUserGroups ALTER COLUMN UserId uniqueidentifier NOT NULL
```

## Alter Column name

```sql
EXEC sp_RENAME 'DueDiligenceAnswers.Answer' , 'AnswerText', 'COLUMN'
```

## Drop constraint

```sql
ALTER TABLE InvestorRelationsUserGroups 
  DROP CONSTRAINT FK_InvestorRelationsUserGroups_InvestorRelationsUsers_UserId
```

## Drop index

```sql
DROP INDEX IX_InvestorRelationsUserGroups_UserId ON InvestorRelationsUserGroups
```

