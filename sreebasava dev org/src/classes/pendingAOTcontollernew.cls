public class pendingAOTcontollernew { 
public string id1;

  public pendingAOTcontollernew(){ 
  
 
    //controller.setPageSize(20); 
    
  }
  
  
 List<Field_Compliance__c> rqs;

 
 public List<Field_Compliance__c> getReq() {

 try{
  rqs = [select Name , Transaction_Type__c,Date_Created__c,User__c ,Status__c from Field_Compliance__c where Status__c = 'PENDING AOT' and ReceivingRep__c =: userinfo.getUserId() ];
  //return  rqs;
 }
 
 catch (DMLException e){
                // show the messages to the user
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'No Sites Selected'));
            }
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