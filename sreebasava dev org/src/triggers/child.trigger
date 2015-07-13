trigger child on Review__c(before insert){

List<id> parent=New list<id>();

list<Job_application__c>jp=new list<Job_application__c>();

For(Review__c R:trigger.new){

Parent.add(R.Job_application__c);

}

if(!parent.isempty()){

  for(Job_application__c R :[Select id,Total_Rating__c,status__c from Job_application__c where id IN: parent]){

    R.status__c='New';

    jp.add(r);

  }

update jp;

}

}