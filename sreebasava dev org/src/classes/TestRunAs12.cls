@isTest
                    
private class TestRunAs12 {
   public static testMethod void testRunAs() {
      // Setup test data
      // This code runs as the system user
      Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
      User u = new User(Alias = 'standt34', Email='standarduser1@testorg1.com', 
      EmailEncodingKey='UTF-8', LastName='Testing45', LanguageLocaleKey='en_US', 
      LocaleSidKey='en_US', ProfileId = p.Id, 
      TimeZoneSidKey='America/Los_Angeles', UserName='basavastandarduser@tsestorg.com');

      System.runAs(u) {
         // The following code runs as user 'u' 
         System.debug('Current User: ' + UserInfo.getUserName());
         System.debug('Current Profile: ' + UserInfo.getProfileId()); 
      }
   }
}