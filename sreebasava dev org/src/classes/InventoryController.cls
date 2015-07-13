public class InventoryController
{

  public  PhysicalInventory__c customobject;
  
  
 public InventoryController(ApexPages.StandardController stdController) {
 
 
 customobject = (PhysicalInventory__c)stdController.getRecord();  
   
     
    }
   
       
    public PageReference cancel()
    
    {
     return new Pagereference('/apex/SamplesManagementPage').setredirect(true);
 
    }
  
   public pagereference save() {
  
  
  try{
 // String id2 = apexpages.currentpage().getparameters().get('id1');
  //customobject.Field_Compliance__c =  id2; 
customobject.Status__c = 'CLOSED';  
  insert customobject ;
  system.debug('inserted');
  
   
   }
   catch(Exception e)
{
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Error in saving record'));

}
   return new Pagereference('/apex/SamplesManagementPage').setredirect(true);
   
 }
 
  

 }