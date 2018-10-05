@isTest
public class contact_field_validation_negative_test {

    static testMethod void testBlankContactRole(){
        validate_contact_fields.validateContactRole('');
        checkTest('Please select a Contact Role');
    }
    
    static testMethod void testBlankEmail(){
        validate_contact_fields.validateEmail('');        
        checkTest('Email is required');
    }
    
    static testMethod void testInvalidEmail(){
        validate_contact_fields.validateEmail('testemail.com');        
        checkTest('Please enter a valid email address');
    }
    
    static testMethod void testBlankFirstName(){
        validate_contact_fields.validateFirstName('');        
        checkTest('First Name is required');
    }
    
    static testMethod void testInvalidFirstName(){
        String fn = generateRandomString(41);
        System.Debug('First Name ' + fn);
        
        validate_contact_fields.validateFirstName(fn); 
        checkTest('First Name cannot be more than 40 characters');
    }
    
    static testMethod void testBlankLastName(){
        validate_contact_fields.validateLastName('');        
        checkTest('Last Name is required');
    }
    
    static testMethod void testInvalidLastName(){
        String ln = generateRandomString(81);
        System.Debug('Last Name ' + ln);
        
        validate_contact_fields.validateLastName(ln);
        checkTest('Last Name cannot be more than 80 characters');
    }
    
    static testMethod void testBlankJobTitle(){
        validate_contact_fields.validateJobTitle('');
        checkTest('Job Title is required');
    }
    
    static testMethod void testBlankPhoneNumber(){
        validate_contact_fields.validatePhoneNumber('');
        checkTest('Phone Number is required');
    }
    
    static testMethod void testBlankAssistant(){
        validate_contact_fields.validateAssistant('');
        checkTest('Assistant Name is required');
    }
    
    static void checkTest(String message){
        ApexPages.Message[] msgs = ApexPages.getMessages();
        System.Debug('There are ' + msgs.size() + ' messages');
        System.assertNotEquals(0, msgs.size());
        
        Boolean messageFound = false;
        
        for(ApexPages.Message msg : msgs){
            if(msg.getSummary() == message)
            	messageFound = true;
        }
        
        System.assert(messageFound);
    }
    
    public static String generateRandomString(Integer len){
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while(randStr.length() < len){
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
        }
        return randStr;
    }
    
}