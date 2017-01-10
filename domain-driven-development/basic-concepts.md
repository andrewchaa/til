# Basic Concepts

## Associations

A domain model’s structure is composed of entities and value objects that represent concepts in the problem domain. 
Associations that do not support behavior and exist only to better reflect reality add unnecessary complexity to a domain model. 
Associations that can be traversed in more than one direction also increase complexity.

1. Favour a single traversal direction

   ![Single Directional Association](https://github.com/andrewchaa/WILT/raw/master/domain-driven-development/images/single-directional-association.jpg)

2. Qualifying associations

   Only the calls for the current period can be retrieved
   
   ![qualifying association](https://github.com/andrewchaa/WILT/raw/master/domain-driven-development/images/qualifying-associations.jpg)
   
   ```
   public class ContractRepository
   {
       public Contract GetBy(ContractId id, Period period)
       {
           ....
       }
   }
   ```

3. Prefer Ids over Object References

## Aggregates

* Design around Domain Invariants
* Transactional Consistency Internally. Avoid large transactional boundary and align transactional boundaries with domain invariants.

   
