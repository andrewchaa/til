# Mock Property or Indexer

```csharp
public interface ILoanRepository
{
   LoanType LoanType{get;set;}
   float Rate {get;set;}
    
   List<LoanType> GetLoanTypes();
   List<Loan> GetCarLoans();
}

var loanRepository = new Mock<ILoanRepository>();
loanRepository.Setup(x => x.LoanType, LoanType.CarLoan);
loanRepository.Setup(x => x.Rate, 12.5);

loanRepository.SetupSet(x => x.Rate = 12.5F);
loanRepository.SetupGet(x => x.Rate);


```
