public class ReadXMLController{
    public Blob XMLBody{get;set;}
    public List<contactName> contactList{get;set;}
    public class contactName{
        public String fName{get;set;}
        public String LName{get;set;}
        public String Manager{get;set;}
        public String Position{get;set;}
    }
    
    public void readXML(){
        // you can also use here your rest response like res.getBody()
        parseXMLResponse(XMLBody.toString());
    }
    
    void parseXMLResponse(String XMLResp){
        XmlStreamReader reader = new XmlStreamReader(XMLResp); 
        contactList = new List<contactName>();
        integer i = 0;
        while(reader.hasNext()){        
            if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'row') {
                contactName con = new contactName();
                while(reader.hasNext()){
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getAttributeValueAt(0) == 'First Name'){
                        reader.next();
                        con.FName = reader.getText();
                    }
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getAttributeValueAt(0) == 'Last Name'){
                        reader.next();
                        con.LName = reader.getText();
                    }
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getAttributeValueAt(0) == 'Reporting Manager'){
                        reader.next();
                        con.Manager = reader.getText();
                    }
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getAttributeValueAt(0) == 'Position'){
                        reader.next();
                        con.Position = reader.getText();
                    }
                    if(reader.getEventType() == XmlTag.END_ELEMENT && reader.getLocalName() == 'row'){
                        contactList.add(con);
                        break;
                    }
                    reader.next();
                }                
            }
            reader.next();
        }
    }
}