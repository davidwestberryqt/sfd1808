@isTest
public class controller_test {
    static testMethod void controllerTest(){
        sf_dev_test_controller controller = new sf_dev_test_controller();
        controller.cont_role = 'TECH';
        controller.email = 'admin@salesforce.com';
        controller.first_name = 'Test';
        controller.last_name = 'Contact';
        controller.phone_num = '555-555-5678';
        controller.job_title = 'Operations Manager';
        controller.assistant = 'Betty';
        
        controller.create_contact();
        
        ApexPages.Message[] msgs = ApexPages.getMessages();
        System.Debug('There are ' + msgs.size() + ' messages');
        System.assertEquals(1, msgs.size());
        
        Boolean messageFound = false;
        
        for(ApexPages.Message msg : msgs){
            if(msg.getSummary().contains('Successfully Inserted'))
                messageFound = true;
        }
        
        System.assert(messageFound);        
    }
}