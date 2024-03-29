public class RestCalloutDemo {
    
    public string weatherJSON; 
    public string city{get;set;}  
    public WeatherWrapper ww{get;set;}
    
    public pageReference requiredWeatherJSON()
    {
        //Step 1: Create a http request object
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        
        //End point will be your rest service URL
        String endpoint = 'http://api.openweathermap.org/data/2.5/weather?q='+city;
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        
        //step 2:get response
        HttpResponse response = httpProtocol.send(request);
            weatherJSON = response.getBody();
       
        //Step 3:parse the received JSON
        //please refer my post "PARSING JSON IN SALESFORCE AND SHOWING DATA IN A VISUALFORCE TABLE" for more info on parsing
          JSONParser parser = JSON.createParser(weatherJSON);
            while (parser.nextToken() != null) {
                   
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        // Read entire JSON object, including its array of items.
                      ww = ( WeatherWrapper)parser.readValueAs(WeatherWrapper.class);                     
                 }
                }
         
               return null;
            }
        
     
    //This will be the main wrapper for JSON
      public class WeatherWrapper
  {
      //Write a inner class for each JSON object and declare it in the main class as shown below.
      public coordinates coord{get;set;}
      public sys sys{get;set;}
      //if we have a JSON array we have to declare a list of that particular inner class type
      public List<weather> weather{get;set;}
      
      
    
  }
    
   public class coordinates
  {
     public String lon{get;set;}
     public String lat{get;set;}
  }
   
    
      public class sys
  {
     public String country{get;set;}
     public String sunrise{get;set;}
     public String sunset{get;set;}
  } 
      public class weather
  {
     public String id{get;set;}
     public String main{get;set;}
     public String description{get;set;}
     public String icon{get;set;}
  }   
}