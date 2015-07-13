public class AccountDML {
    // ApexPages.StandardSetController must be instantiated
   
   public List<Account> AccountsOrigList {get;set;}
   public List<AccountWrapper> AccountsWrappersList {get;set;}

   
   public ApexPages.StandardSetController setCon {
        get {
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                     [SELECT Name, ID FROM Account]));
            return setCon;
        }
        set;
    }
    
    public List<AccountWrapper> getAccountList() {
        if (AccountsOrigList == null)
        { AccountsOrigList = setCon.getRecords(); 
          AccountsWrappersList = new List<AccountWrapper>();
          for (Account avar : AccountsOrigList)
          {
            AccountsWrappersList.add(new AccountWrapper(avar,false));
          }
        }  
        
        return AccountsWrappersList ;
    }
    
    
    public class AccountWrapper
    {
        public Account acc {get; private set;}
        public Boolean DeleteInd {get; set;}
      
        public AccountWrapper(Account a , Boolean dInd)
          {
           DeleteInd = dInd;
           acc = a;
          }
    }
    
    public Pagereference SaveAcc()
     {
        List<Account> AccountsToDelete = new List<Account>();
        List<Account> AccountsToUpsert = new List<Account>();  
 
        for (AccountWrapper avar : AccountsWrappersList )
        {
            if (avar.DeleteInd == True)
                {
                 if (avar.acc.id != null)               
                    {System.Debug (avar.acc.name);
                    AccountsToDelete.add(avar.acc);}
                    
                }
            else
                {AccountsToUpsert.add(avar.acc); }            
        }
      
       delete AccountsToDelete; 
       upsert AccountsToUpsert;
              
       AccountsOrigList = [SELECT Name, ID FROM Account] ;
       AccountsWrappersList = new List<AccountWrapper>();
       for (Account avar : AccountsOrigList)
          {
            AccountsWrappersList.add(new AccountWrapper(avar,false));
          }
       
      PageReference secondPage = Page.DMLThankYou;
      secondPage.setRedirect(true);
      return secondPage; 

     }
    
     public void AddRow()
     {
        Account newAcc = new Account();
        AccountsWrappersList.add(new AccountWrapper(newAcc,false));
       
     }
    
}