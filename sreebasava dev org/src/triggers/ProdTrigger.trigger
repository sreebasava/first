trigger ProdTrigger on Prod__c (after insert) {
 if(trigger.isAfter){
  if(trigger.isInsert){
   AutoSubmit.autoSubmitRecord(trigger.new);
  }
 }

}