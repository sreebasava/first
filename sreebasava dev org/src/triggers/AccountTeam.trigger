trigger AccountTeam on Account (after update) 
{ AccountTeamMember[] newmembers = new AccountTeamMember[]{}; 
//list of new team members to add 
AccountShare[] newShare = new AccountShare[]{}; 
//list of new shares to add

 for(Account a:trigger.new)
{ 
AccountTeamMember Teammemberad=new AccountTeamMember();
 Teammemberad.AccountId=a.id; 
Teammemberad.UserId='005i0000002648K'; 
Teammemberad.TeamMemberRole = 'Account Manager';
 newmembers.add(Teammemberad); 
} 

Database.SaveResult[] lsr = Database.insert(newmembers,false);

//insert any valid members then add their share entry if they were successfully added 

Integer newcnt=0; 

for(Database.SaveResult sr:lsr){ 

if(!sr.isSuccess())

{ Database.Error emsg =sr.getErrors()[0]; 

system.debug('\n\nERROR ADDING TEAM MEMBER:'+emsg); 

}else

{ 
newShare.add(new AccountShare(UserOrGroupId=newmembers[newcnt].UserId, AccountId=newmembers[newcnt].Accountid, AccountAccessLevel='Read',OpportunityAccessLevel='Read')); 

} 

newcnt++;   

} 

Database.SaveResult[] lsr0 =Database.insert(newShare,false); 

//insert the new shares

 Integer newcnt0=0;
  for(Database.SaveResult sr0:lsr0)
  { if(!sr0.isSuccess())
  { Database.Error emsg0=sr0.getErrors()[0];
   system.debug('\n\nERROR ADDING SHARING:'+newShare[newcnt0]+'::'+emsg0); 
   } 
   newcnt0++; 
   } 
   }