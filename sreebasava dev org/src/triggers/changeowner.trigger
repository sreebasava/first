trigger changeowner on Field_Compliance__c (after insert) {
for (Field_Compliance__c c : Trigger.new) {
         
            c.ownerid = c.SalesRep__c;     
         }
   }