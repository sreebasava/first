public class samplesclass
{

  public Date DateReceived{get;set;}
  
  public  Sample_Object_Item__c customobject;
  String id2 = apexpages.currentpage().getparameters().get('id1');
 
  
  
 public samplesclass(ApexPages.StandardController stdController) {
 
 
 customobject = (Sample_Object_Item__c)stdController.getRecord();  
   
     
    }
   
       
    public PageReference cancel()
    {
     return new Pagereference('/apex/SamplesManagementPage').setredirect(true);
 
    }
  
   public pagereference save() {
  
  
  try{
 // String id2 = apexpages.currentpage().getparameters().get('id1');
  customobject.Field_Compliance__c =  id2; 
  insert customobject ;
  system.debug('inserted');
  
   
   }
   catch(Exception e)
{
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Error in saving record'));

}
   return new Pagereference('/apex/SamplesManagementPage').setredirect(true);
   
 }
 
 public pagereference addmore() {
 
  try{
  String id2 = apexpages.currentpage().getparameters().get('id1');
  customobject.Field_Compliance__c =  id2; 
  insert customobject ;
  system.debug('inserted');
  
   
   }
   catch(Exception e)
{
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Error in saving record'));

}
   PageReference pageRef = new Pagereference('/apex/samples');
        pageRef.getParameters().put('id1',id2);
       
   return pageRef;
 
}
 }