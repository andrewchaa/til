# Useful sql queries

* [Handle pagination](#handle-pagination)
* [Get an exclusive access](#get-an-exclusive-access)
* [Subquer](#subquery)

### Handle pagination

```sql
SELECT *
  FROM Companies c JOIN Entities e 
    ON e.EntityId = c.CompanyId
 ORDER BY e.EntityId
OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY
```

### Get an exclusive access  

```sql
// Getting an exclusive access 
ALTER DATABASE [Database-Name] SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
ALTER DATABASE [Database-Name] SET MULTI_USER
```

```sql
// Grant permission at object
GRANT SELECT, UPDATE, INSERT ON dbo.[Restaurants] TO RestaurantEvents
```

### Subquery

```sql
select c.*,
       e.*,
       (select AttributeValue
         from Attributes ea
        where ea.EntityId = e.Entityid
          and ea.AttributeType = 'Email')
           as Email,
  from onboarding.Companies c
  join onboarding.Entities e
    on c.CompanyId = e.EntityId
 where e.EntityUid = '409aaf5ed58c4611bb4fa5da3700ea9e'
```

### Managing columns

```sql
// Adding a column
ALTER TABLE Companies ADD BuyerCompany_EnableBidOnLedgerTrade bit NOT NULL DEFAULT 1

ALTER TABLE UltraUsers ADD 
    HttpReferer nvarchar(1024) NULL,
    MarketingChannel nvarchar(1024) NULL,
    ReferralSource nvarchar(512) NULL,
    ReferralOtherText nvarchar(2048) NULL

// Drop a column
ALTER TABLE InvestorRelationsUserGroups DROP COLUMN UserId

// Alter column type
ALTER TABLE InvestorRelationsUserGroups ALTER COLUMN UserId uniqueidentifier NOT NULL

// Alter Column name
EXEC sp_RENAME 'DueDiligenceAnswers.Answer' , 'AnswerText', 'COLUMN'
```

### Index

```sql
// Drop constraint
ALTER TABLE InvestorRelationsUserGroups 
DROP CONSTRAINT FK_InvestorRelationsUserGroups_InvestorRelationsUsers_UserId

// Drop index
DROP INDEX IX_InvestorRelationsUserGroups_UserId ON InvestorRelationsUserGroups

// Creating an index

CREATE NONCLUSTERED INDEX [IX_UserData_Id] ON [dbo].[UserData]
(
    [UserDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

```


