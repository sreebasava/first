global class scheduledAccountUpdate implements Schedulable
{
    global void execute(SchedulableContext SC)
    {
        AccountUpdate acc = new AccountUpdate('Description','Updated Account');
    }
}