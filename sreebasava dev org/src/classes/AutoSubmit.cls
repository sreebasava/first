public class AutoSubmit {
 public static void autoSubmitRecord(List<Prod__c> plist){
  List<String> l = new List<String>{'srinivas b', 'Rep1 User'};
  Map<String, Id> m = getMap(l);
  for(Prod__c p: plist){
   if(p.Amount__c > 15000){
    submitApproval(m.get('srinivas b'), p.Id);
   } else {
    submitApproval(m.get('Rep1 User'), p.Id);
   }
  }
  
  
 }
 
 //Sent approval record
 private static void submitApproval(Id uId, Id aId){
  Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval automatically using Trigger');
        req1.setObjectId(aId);
        req1.setNextApproverIds(new Id[] {uId});
        // Submit the approval request for the Opportunity
        Approval.ProcessResult result = Approval.process(req1);
 }
 
 private static Map<String,Id> getMap(List<String> username){
  Map<String,Id> m = new Map<String,Id>();
    
  List<User> uList = [select Id, name from User where name in :username];
  for(User u: uList){
   m.put(u.name, u.Id);
  }
  
  return m;
 }
}