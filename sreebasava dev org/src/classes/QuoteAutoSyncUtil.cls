public class QuoteAutoSyncUtil
{
   
    public static void syncQuote(Map<Id, Id> quoteMap)
    {
        List<Opportunity> oppList = new List<Opportunity>();
       
        for(Id currentQuote : quoteMap.keyset())
        {
            Opportunity opp = new Opportunity();
            opp.Id = quoteMap.get(currentQuote);
            opp.SyncedQuoteId = currentQuote;
            oppList.add(opp);
        }
       
        Integer oppSize = oppList.size();
        update oppList[oppSize -1 ];
 
    }
   
}