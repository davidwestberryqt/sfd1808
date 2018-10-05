public class DemoClass {
    public void sendMail(String address, String subject, String body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method of the Messaging Class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] {mail});
        
        inspectResults(results);
        
    }
    
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
       
        for(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                System.debug('Email sent successfully');
            }
            else{
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());
            }
        }
        
        return sendResult;
    }
 /*   
    public static void getPositionById(String pId){
        Set<Id> setIds = new Set<Id>();
        setIds.add(pId);
        List<Position__c> positions = [SELECT Id, Name, Hiring_Manager__c FROM Position__c WHERE Id in :setIds];
        Position__c p = positions[0];
        system.debug(p.Name + '\n new line');
        system.debug(p.Hiring_Manager__c);
    }
  */  
}