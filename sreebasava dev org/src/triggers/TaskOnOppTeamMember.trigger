trigger TaskOnOppTeamMember on OpportunityTeamMember (after insert) {
list<Task> NewTask = new list<Task>();
if(trigger.IsInsert)
{
for(OpportunityTeamMember oppTeam : trigger.new)
{
Task tasksInsert = new Task();
tasksInsert.WhatId = OppTeam.Opportunityid;
tasksInsert.OwnerId = oppTeam.Userid;
tasksInsert.Subject = 'Great Daddy';
tasksInsert.ActivityDate = date.today();
tasksInsert.Priority = 'Normal';
NewTask.add(tasksInsert);

}
}
Database.insert(NewTask);
}