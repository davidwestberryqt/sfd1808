@isTest
public class preventDuplicate_Test {
    static testMethod void testDuplicateTrigger(){
        Lead[] l1 = new Lead[]{
            new Lead(Email='test@org.com', LastName='Smith', Company='ABC Company')
                };
                    insert l1;
        
        Lead[] l2 = new Lead[]{
            new Lead(Email='test@org.com', LastName='Smith', Company='ABC Company')
        };
                    
        try { 
        	insert l2; 
        } catch(System.DmlException e){
        	system.assert(
            	e.getMessage().contains(
                	'first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, A lead with this email address already exists in the system.'
                ), e.getMessage());
       	}

        Lead[] l3 = new Lead[]{
            new Lead(Email='test2@org.com', LastName='Smith', Company='ABC Company'),
            new Lead(Email='test2@org.com', LastName='Smith', Company='ABC Company')
        };
        
        try { 
        	insert l3; 
        } catch(System.DmlException e){
        	system.assert(
            	e.getMessage().contains(
                	'first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Another new lead has the same email address.'
                ), e.getMessage());
       	}

        Lead[] lup = new Lead[] {
            new Lead(Email='test2@org.com', LastName='Smith', Company='ABC Company')
        };
            insert lup;
        Lead test2 = [SELECT Id, Email FROM Lead WHERE Email = 'test2@org.com' LIMIT 1];
        system.assert(test2 != null);
        test2.Email = 'test@org.com';
        try {
            update test2;
        } catch(System.DmlException e){
            system.assert(e.getMessage().contains(
                'first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, A lead with this email address already exists in the system.'
            ), e.getMessage());
        }
    }
}