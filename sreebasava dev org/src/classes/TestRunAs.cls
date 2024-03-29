@istest
public class TestRunAs {
   public static testMethod void testRunAs() {
      // Setup test data
      // This code runs as the system user

         Profile p = [select id from profile where name='rep']; 
         User u = new User(alias = 'standtss', email='standarduse12r@testorg.com', 
            emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, 
            timezonesidkey='America/Los_Angeles', username='standarduser@testorg.com');


         System.runAs(u) {
           // The following code runs as user 'u' 
           System.debug('Current User: ' + UserInfo.getUserName());
           System.debug('Current Profile: ' + UserInfo.getProfileId()); }
           // Run some code that checks record sharing
        }
}