public  with Sharing class tsample 
{
    public List<Account> getVar()
    {
        return [SELECT Name FROM Account];
    }     
}