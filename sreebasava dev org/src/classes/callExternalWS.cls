Public class callExternalWS
{
    public void invokeExternalWs()
    {
        HttpRequest req = new HttpRequest();
        //Set HTTPRequest Method
        req.setMethod('POST');
        req.setEndpoint('https://api.authorize.net/soap/v1/Service.asmx');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'text/xml; charset=utf-8');
        req.setHeader('SOAPAction', 'https://api.authorize.net/soap/v1/CreateCustomerProfile');//
        string b =   '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">'+
                      '<soap:Body><CreateCustomerProfile xmlns="https://api.authorize.net/soap/v1/">'+
                      '<merchantAuthentication><name>Merchant name here</name>'+
                      '<transactionKey>Transaction Key here</transactionKey></merchantAuthentication>'+
'<profile><description>description</description>'+
                      '<email>sforce2009@gmail.com</email>'+
                      '<paymentProfiles>'+
                      '<CustomerPaymentProfileType><customerType>individual</customerType>'+
'<payment><creditCard><cardNumber>6011000000000012</cardNumber>'+
                      '<expirationDate>2009-12</expirationDate></creditCard>'+
                      '</payment></CustomerPaymentProfileType></paymentProfiles></profile>'+
                      '</CreateCustomerProfile></soap:Body></soap:Envelope>';
        req.setBody(b);
        Http http = new Http();
        try {
          //Execute web service call here       
          HTTPResponse res = http.send(req);   
          //Helpful debug messages
          System.debug(res.toString());
          System.debug('STATUS:'+res.getStatus());
          System.debug('STATUS_CODE:'+res.getStatusCode());
        //YOU CAN ALWAYS PARSE THE RESPONSE XML USING XmlStreamReader  CLASS
       } catch(System.CalloutException e) {
            //Exception handling goes here....
     }       
}
}