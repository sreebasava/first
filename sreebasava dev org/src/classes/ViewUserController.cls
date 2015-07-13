public class ViewUserController  
 { 
    public String countries { get; set; }
 
   public List<student__c> allusers;    
   public List<student__c> getAllUsers()  
   {  
     if(allusers==null)  
     {  
       allusers=[SELECT email__c,name__c from student__c];  
     }  
     return allusers;  
   }  
 }