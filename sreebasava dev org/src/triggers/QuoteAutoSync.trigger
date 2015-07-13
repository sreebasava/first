trigger QuoteAutoSync on Quote (after insert)
{
    Map<Id, Id> quoteMap = new Map<Id, Id>();
    for(Quote currentQuote : Trigger.New)
    {
      if(currentQuote.Status == 'Approved')
      {
          quoteMap.put(currentQuote.Id, currentQuote.OpportunityId);
      }
    }
   
    QuoteAutoSyncUtil.syncQuote(quoteMap);
}