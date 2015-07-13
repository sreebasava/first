public class pendingAORcontoller { 
public string id1;

  public pendingAORcontoller(){ 
  
 
    //controller.setPageSize(20); 
    
  }
  
  
 List<Field_Compliance__c> rqs;

 
 public List<Field_Compliance__c> getReq() {

 
  rqs = [select Name , Transaction_Type__c,Date_Created__c,User__c ,Status__c from Field_Compliance__c where Status__c = 'PENDING AOR' and ReceivingRep__c =: userinfo.getUserId() ];
  return  rqs;
 }
  
  public PageReference detail()
    {
   id1 = ApexPages.currentPage().getParameters().get('param');
    
   PageReference p = new PageReference('/apex/FieldComplianceDetail1?id=' + id1);
   p.getParameters().put('msg',id1);
   return p;
   }
}