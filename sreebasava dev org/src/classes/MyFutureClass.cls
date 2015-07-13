global class MyFutureClass {  
 @future   
   public static void myMethod() {  
     EmailClass.SendEmailNotification();  
     //do callout, other long running code  
   }  
 }