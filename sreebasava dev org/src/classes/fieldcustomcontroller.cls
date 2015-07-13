public class fieldcustomcontroller
{
public Date selecteddate{get;set;}
public Field_Compliance__c fc
{

get{

fc = [select Name__c,Description__c,Status__c,Transaction_Type__c,Date_Created__c,SalesRep__c,Date_Received__c from Field_Compliance__c where Id =:System.currentPagereference().getParameters().get('msg')];

return fc;
}

set;

}
   public  fieldcustomcontroller()
   {
  
       
    }
    
    public void save()
    {
    fc.Date_Received__c = selecteddate;
    update fc;
   
   /* Field_Compliance__c fc1 = [select Name__c,Description__c,Status__c,Transaction_Type__c,Date_Created__c,SalesRep__c,Date_Received__c from Field_Compliance__c where Id =:System.currentPagereference().getParameters().get('msg')];

try {
fc1.Date_Received__c  = selecteddate;
    update fc;
} catch (DmlException e) {
    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error creating new item.'));
      
} */
   
    
    
    }
    }