@isTest
public class contact_field_validation_positive_test {
    
    static testMethod void testContactRole(){
        validate_contact_fields.validateContactRole('TECH');
        validate_contact_fields.validateContactRole('CUST');
        validate_contact_fields.validateContactRole('EXEC');
        checkTest();
    }
    
    static testMethod void testEmail(){
        validate_contact_fields.validateEmail('admin@salesforce.com');
        checkTest();
    }
    
    static testMethod void testFirstName(){
        String fn = contact_field_validation_negative_test.generateRandomString(40);
        validate_contact_fields.validateFirstName(fn);
        validate_contact_fields.validateFirstName('John');
        checkTest();
    }
    
    static testMethod void testLastName(){
        String ln = contact_field_validation_negative_test.generateRandomString(80);
        validate_contact_fields.validateLastName(ln);
        validate_contact_fields.validateLastName('Smith');
        checkTest();
    }
    
    static testMethod void testPhoneNumber(){
        validate_contact_fields.validatePhoneNumber('555-555-1234');
        checkTest();            
    }
    
    static testMethod void testJobTitle(){
        validate_contact_fields.validateJobTitle('Manager');
        checkTest();            
    }
    
    static testMethod void testAssistant(){
        validate_contact_fields.validateAssistant('Jane');
        checkTest();            
    }
    
    static void checkTest(){
        ApexPages.Message[] msgs = ApexPages.getMessages();
        System.assertEquals(0, msgs.size());
    }
}