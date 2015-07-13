global class AccountUpdate implements Database.batchable<sObject>
{

    String query,field,value;
   
    global AccountUpdate(String f, String v)
    {
        field = f;
        value = v;
        query = 'Select ' + field + ' FROM Account';
    }

    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
         for(sobject s : scope)
         {
             s.put(Field,Value);
         }
         update scope;
    }
   
    global void finish(Database.BatchableContext BC)
    {
    }
   
}