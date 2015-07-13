trigger Test_Trigger on Account (before update) {

system.debug('..trigger called..');

  for (Account object1 : Trigger.New) {
  
  System.debug('Trigger.new.size(): ' + Trigger.new.size());

    object1.name= 'New Value Sri';
    
      }
}