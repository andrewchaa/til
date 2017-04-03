## Droping an index

```sql
DROP INDEX IX_UserData_Id ON [dbo].[UserData];
```

## Creating an index

```sql
CREATE NONCLUSTERED INDEX [IX_UserData_Id] ON [dbo].[UserData]
(
	[UserDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
"
```

