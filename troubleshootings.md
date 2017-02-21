# Troubleshootings

## There are no primary or candidate keys in the referenced table

from http://stackoverflow.com/questions/17879735/there-are-no-primary-or-candidate-keys-in-the-referenced-table-that-match-the-re

The foreign key should reference a unique key, whether it be a primary key or uniquely indexed column.

```sql
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_UserId] ON [dbo].[Users]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
```
