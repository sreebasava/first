public Class ApxCls
{
Public List<Account> Records{set;get;}

public ApxCls(Apexpages.StandardController str)
{
Records=[select Name, (select Phone from Contacts),(Select Name from Opportunities) from Account];

}

}