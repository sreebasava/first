public class FieldComplianceDetailClass
{

  public Date DateReceived{get;set;}
  public Sample_Object_Item__c item;
  public  Field_Compliance__c customobject;
  public  Field_Compliance__c  t1;
  public String prodcode{get;set;}
  public String lotnumber{get;set;}
  public integer quantity{get;set;}
  public boolean showinput{get;set;}
  public boolean showoutput{get;set;}
  public Date daterec{get;set;}
  
   
  
   public  String temp3{get;set;}
   
   public Date selecteddate{get;set;}
   
   private PageReference pageRef = ApexPages.currentPage();
   
   String str1 = System.currentPagereference().getParameters().get('msg');
  
 public FieldComplianceDetailClass(ApexPages.StandardController stdController) {
 String str1 = System.currentPagereference().getParameters().get('msg');
 showinput = true;
   showoutput = false;
 
// t1 = (Field_Compliance__c)stdController.getRecord();
 if(str1 != null){
 try{
 t1 = [Select Id,CountRelatedlist__c , Date_Received__c from Field_Compliance__c u where u.Id  =:str1];
 }
 
   catch(DmlException ex)
{
    ApexPages.addMessages(ex);
 }
}    
   

if (t1.Date_Received__c == null)
{
   showinput = true;
   showoutput = false;
 }  
 
 else
 { showinput = false;
 showoutput = true;
 }
      
    }
  
    
      // temp2 = ApexPages.currentPage().getParameters().get('param1');;
   
    
   
    
   /* public PageReference display()
    {
      temp3 = selectedproduct;
      System.debug('inside display' + temp3);
      return null;
      //System.debug(temp3);
    }*/
    
    
   public PageReference cancel()
    {
     return new Pagereference('/apex/SamplesManagementPage').setredirect(true);
 
    }
    
  
   public PageReference save() {
   System.debug('selected'+ selecteddate);
   if((selecteddate != null)&& (t1.CountRelatedlist__c != 0)){
  
   
  // Field_Compliance__c t1 = new  Field_Compliance__c(Id = 'a03i0000004KlNRAA0');
  t1.Date_Received__c = selecteddate;
  t1.Status__c = 'CLOSED';
  
  
   update t1 ;
  return new pagereference('/apex/SamplesManagementPage').setRedirect(true);
  
   
  
  
   
   //PageReference p3 = new Pagereference('/apex/FieldComplianceDetail1?id=t1.Id');
 // return p3;
  
   //PageReference p1 = new Pagereference('/apex/SamplesManagementPage');
   //return p1;
   
 }
 
 else{ 
 
 if (t1.CountRelatedlist__c == 0)
 
 {
 
 showinput = true;
   showoutput = false;
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please add atleast on sample item.');
     
 ApexPages.addMessage(myMsg);

 }
else

if(selecteddate == null)
{
 showinput = true;
   showoutput = false;
 ApexPages.Message myMsg1 = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter the date.');
 ApexPages.addMessage(myMsg1);
}
} 
 
  pageRef.setRedirect(false);
    return pageRef;
    
  }
     
 }