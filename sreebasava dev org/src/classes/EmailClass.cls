global class EmailClass{  
   WebService static void SendEmailNotification() {  
     //create a mail object to send a single email.  
     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();  
     //set the email properties  
     mail.setToAddresses(new string[] {'sreebasava@yahoo.com'});  
     mail.setSenderDisplayName('SF.com Email Agent');  
     mail.setSubject('A new reminder');  
     mail.setHtmlBody('Password');  
     //send the email  
     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail } );  
   }  
 }