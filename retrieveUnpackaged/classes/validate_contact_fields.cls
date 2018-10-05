public class validate_contact_fields {
    
    /**
     * Check that the email field is not blank
     * and that the email address contains '@'
     * 
     * @param email A String containing the Email Address to validate
     */
    public static void validateEmail(String email){
        if(String.isBlank(email)){
            addValidationError('Email is required');
        } else if( !(email.contains('@')) ){
            addValidationError('Please enter a valid email address');
        }
    }
    
    /**
     * Check that the First Name field is not blank
     * and that First Name is not greater than 40 characters
     * 
     * @param firstName A String containing the First Name to validate
     */
    public static void validateFirstName(String firstName){
        if(String.isBlank(firstName)){
            addValidationError('First Name is required');
        } else if(firstName.length() > 40){
            addValidationError('First Name cannot be more than 40 characters');
        }
    }
    
    /**
     * Check that the Last Name field is not blank
     * and that Last Name is not greater than 80 characters
     * 
     * @param lastName A String containing the Last Name to validate
     */
    public static void validateLastName(String lastName){
        if(String.isBlank(lastName)){
            addValidationError('Last Name is required');
        } else if(lastName.length() > 80){
            addValidationError('Last Name cannot be more than 80 characters');
        }
    }
    
    /**
     * Check that Contact Role is not Blank
     * 
     * @param contactRole A String containing the Contact Role to validate
     */
    public static void validateContactRole(String contactRole){
        if(String.isBlank(contactRole)){
            addValidationError('Please select a Contact Role');
        }
    }
    
    /**
     * Check that Job Title is not Blank
     * 
     * @param jobTitle A String containing the Job Title to validate
     */
    public static void validateJobTitle(String jobTitle){
        if(String.isBlank(jobTitle)){
            addValidationError('Job Title is required');
        }
    }
    
    /**
     * Check that Phone Number is not Blank
     * 
     * @param phoneNumber A String containing the Phone Number to validate
     */
    public static void validatePhoneNumber(String phoneNumber){
        if(String.isBlank(phoneNumber)){
            addValidationError('Phone Number is required');
        }
    }
    
    /**
     * Check that Assistant Name is not Blank
     * 
     * @param assistant A String containing the Assistant Name to validate
     */
    public static void validateAssistant(String assistant){
        if(String.isBlank(assistant)){
            addValidationError('Assistant Name is required');
        }
    }
    
    /**
     * Create a page message with the corresponding error message
     * 
     * @param message A String containing the error message to display
     */
    public static void addValidationError(String message){
        ApexPages.addMessage(new ApexPages.Message(
                ApexPages.Severity.FATAL, message
            ));
    }
}