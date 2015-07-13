trigger ContactUpdate on Account (after update) {
    set<Id> acctIds = new set<Id>();
    map<Id, Account> mapAccount = new map<Id, Account>();
    list<Contact> listContact = new list<Contact>();
   
    for(Account acct : trigger.new) {
        acctIds.add(acct.Id);
        mapAccount.put(acct.Id, acct);
    }
   
    listContact = [SELECT MailingStreet, MailingCity, AccountId FROM Contact WHERE AccountId IN : acctIds];
   
    if(listContact.size() > 0) {
        for(Contact con : listContact) {
            con.MailingStreet = mapAccount.get(con.AccountId).BillingStreet;
            con.MailingCity = mapAccount.get(con.AccountId).BillingCity;
        }
        update listContact;
    }
}