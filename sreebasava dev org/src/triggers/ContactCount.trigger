trigger ContactCount on Contact (after insert, after update, after delete) {
    Map<Id, List<Contact>> AcctContactList = new Map<Id, List<Contact>>();
    Set<Id> AcctIds = new Set<Id>();    
    List<Account> AcctList = new List<Account>();
    List<Contact> ConList = new List<Contact>();
    
    if(trigger.isInsert || trigger.isUPdate) {
        for(Contact Con : trigger.New) {
            if(String.isNotBlank(Con.AccountId)){
                AcctIds.add(Con.AccountId);  
            }   
        }  
    }
    
    if(trigger.isDelete) {
        for(Contact Con : trigger.Old) {
            AcctIds.add(Con.AccountId);     
        }  
    }           
    
    if(AcctIds.size() > 0){
        ConList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN : AcctIds];
        
        for(Contact Con : ConList) {
            if(!AcctContactList.containsKey(Con.AccountId)){
                AcctContactList.put(Con.AccountId, new List<Contact>());
            }
            AcctContactList.get(Con.AccountId).add(Con);      
        }                           
        
        System.debug('Account Id and Contact List Map is ' + AcctContactList);
            
        AcctList = [SELECT Number_of_Contacts__c FROM Account WHERE Id IN : AcctIds];
        
        for(Account Acc : AcctList) {
            List<Contact> ContList = new List<Contact>();
            ContList = AcctContactList.get(Acc.Id);
            Acc.Number_of_Contacts__c = ContList.size();
        }    
        
        System.debug('Account List is ' + AcctList);
        update AcctList;    
    }

}