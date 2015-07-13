public with sharing class ViewStateController {

public Integer a {get;set;}
private Integer b {get;set;}
Transient Integer c {get;set;}
private Integer d{get;set;}
public Opportunity opp {get;set;}

public ViewStateController()
{
    a = 20;
    b = 30;
    c = 40; //It will not visible in ViewState
    opp = new Opportunity(name='Test',StageName='Test');
}
//Call this method in Postback
public void changeData()
{
    if(a == 20)
    {
        a = 2;
    }
    if(b == 30)
    {
        b = 3;
    }
    //As c is declared as Transient, it will not persist the value in Postback
    if(c == 40)
    {
        d = 4;
    }
    else{
        d= 40;//As C value not persisted, else block will execute
    }
}
}