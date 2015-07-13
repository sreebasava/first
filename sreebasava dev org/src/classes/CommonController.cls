public Class CommonController{  
  
    // Constructor  
    public CommonController()  
    {  
          
    }  
    // Public Properties  
    public String valueHoldertExt{get;set;}  
    public String valueHolderHidden{get;set;}  
      
    // To go to next page mantaining values of controller  
    public pageReference goToNextPage()  
    {  
        PageReference pgRef =  new PageReference('/apex/Screen2');  
        return pgRef ;  
    }  
      
    // To go to Previous page mantaining values of controller  
    public pageReference goToPreviousPage()  
    {  
        PageReference pgRef =  new PageReference('/apex/Screen1');  
        return pgRef ;  
    }  
}