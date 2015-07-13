public with sharing class InventoryCountController {
public integer empNumber;

//LIST<AggregateResult> count = new LIST<AggregateResult>();
//public integer count1;

//public List<Field_Compliance__c> count;



public integer getCount()
{

AggregateResult[] count = [select sum(SumRelatedList__c) sum  from Field_Compliance__c where ReceivingRep__c =: userinfo.getUserId()  and Status__c = 'CLOSED'];
for(AggregateResult sobj : count)
{    empNumber = Integer.valueOf(sobj.get('sum'));
}

return empNumber;
}


}