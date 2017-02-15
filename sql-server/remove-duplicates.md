from http://stackoverflow.com/questions/3317433/delete-duplicate-records-in-sql-server

```
delete DueDiligenceQuestionTagMaps
 where DueDiligenceQuestionTagId IN 
	(select DueDiligenceQuestionTagId
	from (
	  select *, rn=row_number() over (partition by TagText order by Id)
	  from DueDiligenceQuestionTags 
	) x
	where rn > 1)

delete x
from (
  select *, rn=row_number() over (partition by TagText order by Id)
  from DueDiligenceQuestionTags 
) x
where rn > 1;

```
