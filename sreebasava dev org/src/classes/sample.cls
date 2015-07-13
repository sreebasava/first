public with sharing class sample
{

    public List<Account> acc {get;set;}
    public sample()
    {
        acc = [SELECT Name, AccountNumber FROM Account];
    } 
   
}