public class TransferClass
{

  public Date DateReceived{get;set;}
  public Sample_Object_Item__c item;
  public  Field_Compliance__c customobject;
  public  Field_Compliance__c  t1;
  public List<Lot_Number__c> ProductTemp = new List<Lot_Number__c>();
  public List<Lot_Number__c> LotTemp = new List<Lot_Number__c>();
  public String prodcode{get;set;}
  public String lotnumber{get;set;}
  public integer quantity{get;set;}
  public boolean showinput{get;set;}
  public boolean showoutput{get;set;}
  public Date daterec{get;set;}
  public boolean display{get;set;}
  public string masterid;
  
   public String selectedproduct{get;set;}
    
   public String selectedlot{get;set;}
  
   public  String temp3{get;set;}
   
   public Date selecteddate{get;set;}
   
  
   
   
  
 public TransferClass(ApexPages.StandardController stdController) {
 
 
 customobject = (Field_Compliance__c)stdController.getRecord();  
   
     
    }
   
       
    public PageReference cancel()
    {
     return new Pagereference('/apex/SamplesManagementPage').setredirect(true);
 
    }
  
   public pagereference save() {
  
  
  try{
  
   customobject.Status__c = 'PENDING AOT';
  
  insert customobject ;
 
 /*if(customobject.id != null)
  {
  
  display = true;
  }
 */
   
   }
   catch(Exception e)
{
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Error'));

}
 masterid = customobject.id;
  system.debug('inserted master'+ customobject.id);
   PageReference pageRef = Page.samples;
        pageRef.getParameters().put('id1',masterid);
       
   return pageRef; 
   
  // return new Pagereference('/apex/Transfer?id=masterid').setredirect(true);
 
   
   
   
   
 }
 

 }