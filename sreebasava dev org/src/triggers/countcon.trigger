trigger countcon on Contact (after update,after delete, after undelete) {


set<id> accountids = new set<id>();

Map<id,List<Contact>> acccontactmap = new Map<id,List<Contact>>();

List<Contact> clist = new List<contact>();

List<Account> alist = new List<Account>();

If(trigger.Isupdate)
{

for(Contact con: trigger.new)
{

accountids.add(con.Accountid);

}

}

If(trigger.IsInsert)
{

for(Contact con: trigger.new)
{

accountids.add(con.Accountid);

}

}
If(trigger.IsDelete)
{

for(Contact con: trigger.old)
{

accountids.add(con.Accountid);

}

}

if(accountids.size()>0)
{

    clist = [select id,Accountid from contact where id in:accountids];
    
    for(contact c: clist )
    {
    
   if(!acccontactmap.containskey(c.Accountid ))
   {
   
   acccontactmap.put(c.Accountid , new List<contact>());
   
   } 
   
   acccontactmap.get(c.Accountid).add(c);
   
   
    
    
    }


   alist  = [select id,Number_of_Contacts__c from Account where id in:accountids];
   
   for(Account a:alist)
   {
   
     List<Contact> clist1= new List<contact>();
     
     clist1 = acccontactmap.get(a.id);
     
     a.Number_of_Contacts__c = clist1.size();
   
   }
   
   update alist;


}



}