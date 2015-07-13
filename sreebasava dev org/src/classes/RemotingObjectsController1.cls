public with sharing class RemotingObjectsController1 {
 
    /* The remoting method simply instantiates a two custom types, puts
       them into a list and then returns them. */
    @RemoteAction
    public static List<CustomClass> getClassInstances(){
        List<CustomClass> classes = new List<CustomClass>();
 
        CustomClass me = new CustomClass('Wes');
        CustomClass you = new CustomClass('Champ');
 
        classes.add(me);
        classes.add(you);
 
        return classes;
    }
 
    /* My custom type */
    public class CustomClass{
        public String firstName{get;set;}
 
        CustomClass(String firstName){
            this.firstName = firstName;
        }
    }
}