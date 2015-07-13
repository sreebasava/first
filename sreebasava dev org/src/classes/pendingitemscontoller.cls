public class pendingitemscontoller { 
public string iden{get;set;}
public String id1;
public Date DateReceived{get;set;}

  public pendingitemscontoller(ApexPages.StandardSetController controller){ 
    controller.setPageSize(20); 
  }
  
  public PageReference detail()
    {
   id1 = ApexPages.currentPage().getParameters().get('param');
    
   PageReference p = new PageReference('/apex/FieldComplianceDetail1?id=' + id1);
   p.getParameters().put('msg',id1);
   return p;
   }
}