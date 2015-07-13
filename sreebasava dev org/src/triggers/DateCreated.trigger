trigger DateCreated on Field_Compliance__c (before insert) {

for (Field_Compliance__c c : Trigger.new) {
         
            c.Date_Created__c = Date.Today();     
         }
   

}