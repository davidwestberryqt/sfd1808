public class sf_dev_test_controller {
    public String cont_role {get; set;}
    public String email {get;set;}
    public String job_title {get; set;}
    public String first_name {get; set;}
    public String last_name {get; set;}
    public String phone_num {get; set;}
    public String assistant {get; set;}
    
    public sf_dev_test_controller() {
        
    }
    
    /**
	* Validate the input fields
	*/
    public void create_contact() {        
        
        //Validation for Contact Role, Email, First Name, and Last Name
        validate_contact_fields.validateContactRole(cont_role);
        validate_contact_fields.validateEmail(email);
        validate_contact_fields.validateFirstName(first_name);
        validate_contact_fields.validateLastName(last_name);
        
        //Validation for Phone Number if Contact Role is CUST, TECH, or EXEC
        if( cont_role == 'TECH' || cont_role == 'CUST' || cont_role == 'EXEC') {
            validate_contact_fields.validatePhoneNumber(phone_num);
        }
        
        //Validation for Job Title if Contact Role is Tech or EXEC
        if( cont_role == 'TECH' || cont_role == 'EXEC' ){
            validate_contact_fields.validateJobTitle(job_title);
        }
        
        //Validation for Assistant if Contact Role is EXEC
        if(cont_role == 'EXEC' && String.isBlank(assistant)){
            validate_contact_fields.validateAssistant(assistant);
        }
        
        //If there were no validation errors, call the insertContact method
        if(ApexPages.getMessages().size() == 0){
            insertContact();
        }
    }
    
    /**
	* Insert a contact into the database and display a confirmation message
	*/
    public void insertContact(){
            Contact con = new Contact();
            con.Department = cont_role;
            con.Email = email;
            con.FirstName = first_name;
            con.LastName = last_name;
            con.Title = job_title;
            con.AssistantName = assistant;
            con.Phone = phone_num;
            
            //Insert the contact into the database and get a reference to the inserted contact
            Database.SaveResult result = Database.insert( con ); 
            
            //Display the ID of the inserted contact on the page
            ApexPages.addMessage(new ApexPages.Message(
                ApexPages.Severity.INFO, 'Successfully Inserted ' + result.getId()
            ));            
            
            clearInputFields();
    }
    
    /**
	* Clears the input fields
	*/
    public void clearInputFields(){
        cont_role = '';
        email = '';
        first_name = '';
        last_name = '';
        job_title = '';
        assistant = '';
        phone_num = '';
    }
}