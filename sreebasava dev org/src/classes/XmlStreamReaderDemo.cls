global class XmlStreamReaderDemo {
   
   
   public class AccountWrapper {
        public String AccountNumber{get; set;}
        public String AccountName{get; set;}
        public String ParentAccount {get; set;}
        public String BillingStreet {get; set;}
        
        public String ShippingStreet {get; set;}
        
       // public String OwnerId{get;set;}
        
        //public String ShipToId {get; set;}
      //  public String RecordType{get;set;}       
      
    }

 webservice static String create(String requestXML) {
        List<Account> acclist = new List<Account>();
      
        ClsUtilXMLElement acc = new ClsUtilXMLParser().parse(requestXML);
        
       for (ClsUtilXMLElement account : acc.getElements())
       {     
       
         Account acc1 = new account();        
                
        acc1.AccountNumber= account.getAttrs().get('AccountNumber');
        acc1.Name= account.getAttrs().get('AccountName');
        acc1.BillingStreet= account.getAttrs().get('BillingStreet');
        acc1.ShippingStreet= account.getAttrs().get('ShippingStreet');          
        acclist.add(acc1);
        
        }
        insert acclist;
        return null;
        
  }     
        
        
        
    
}