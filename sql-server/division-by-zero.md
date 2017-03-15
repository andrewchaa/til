```sql
select c.Date, c.StrategyId, c.Amount as Capital, p.Amount as Pnl, p.Amount / nullif(c.Amount, 0) as DailyReturn
  from Capital c
  join Pnl p on C.StrategyId = p.StrategyId and c.Date = p.Date
 order by c.Date, c.StrategyId

```
