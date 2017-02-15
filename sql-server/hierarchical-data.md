## Restricting parent by children's data

```
SELECT m.DueDiligenceQuestionId
  FROM DueDiligenceQuestionTags t   
  JOIN DueDiligenceQuestionTagMaps m 
    on t.DueDiligenceQuestionTagId = m.DueDiligenceQuestionTagId   
 WHERE m.DueDiligenceQuestionTagId IN ('87194d6d-5265-4077-91ed-dc841d04cf25', 'e1eeb9af-9ad4-4755-b987-f5a252b2d492')
 GROUP By m.DueDiligenceQuestionId
HAVING COUNT(*) = 2
```
