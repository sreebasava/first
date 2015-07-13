public with sharing class TransactionsController {

public pagereference transfer()
{
  
   return new Pagereference('/apex/Transfer').setredirect(true);
 }  
 
 
 public pagereference AOT()
{
  
   return new Pagereference('/apex/Pending_AOT').setredirect(true);
 }  
 
 public pagereference AOR()
{
  
   return new Pagereference('/apex/Pending_AOR').setredirect(true);
 } 
 
 public pagereference PendingItems()
{
  
   return new Pagereference('/apex/Pending_Itemsnew').setredirect(true);
 }  
 
 public pagereference returns()
{
  
   return new Pagereference('/apex/Return_Page').setredirect(true);
 }  
 
public pagereference inventory()
{

PageReference p = Page.inventory;
return p;
    //return new Pagereference('apex/inventory').setredirect(true);

} 
  public pagereference samples()
{
  
   return new Pagereference('/apex/samples').setredirect(true);
 } 
 
 public pagereference adjustment()
{
  
   return new Pagereference('/apex/Adjustment').setredirect(true);
 } 
 
  public pagereference samplesmanagement()
{
  
   return new Pagereference('/apex/SamplesManagementPage').setredirect(true);
 }

}