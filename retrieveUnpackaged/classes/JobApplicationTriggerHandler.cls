public class JobApplicationTriggerHandler {
    
    public static void sendEmployeeData(){
        for(Job_Application__c app : (List<Job_Application__c>)trigger.new){
            Job_Application__c oldApp = (Job_Application__c) trigger.oldMap.get(app.Id);
            // Make sure the status has changed and that status now equals 'Hired'
            if(oldApp.status__c != app.status__c && app.status__c == 'Hired'){
                // Make the callout to the REST API
                sendEmployee(app.Id);
            }            
        }
    }
    
    @future(callout=true)
    public static void sendEmployee(string id){
        string endpoint = 'https://sfdnewhires.herokuapp.com/api/v1/employees';
        //string endpoint = 'https://mysterious-wildwood-26111.herokuapp.com/1oljq201';
        // Query for the Job_Application__c record
        Job_Application__c app = [SELECT Candidate__r.Full_Name__c, Candidate__r.phone__c, Candidate__r.mobile__c, Candidate__r.email__c,
                                  Position__r.Name, Position__r.location__c, Position__r.functional_area__c, Position__r.job_level__c, Position__r.type__c
                                  FROM Job_Application__c LIMIT 1];
        // Create an Employee object using the data from the Job_Application__c record and related Candidate__c and Position__c records
        Employee emp = new Employee(
            app.Candidate__r.Full_Name__c, 
            app.Candidate__r.phone__c, 
            app.Candidate__r.mobile__c,
            String.valueOf(Date.today()),
            app.Position__r.Name,
            app.Position__r.location__c,
            app.Position__r.functional_area__c,
            app.Position__r.job_level__c,
            app.Position__r.type__c,
            app.Candidate__r.email__c);
        
        // Create the HTTP Request and Response objects
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        
        // Set up the HTTP Request endpoint, method, and data
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBOdy(JSON.serialize(emp));
        
        // Make the HTTP Request
        try {
            res = http.send(req);
            sfdNewHiresSuccessResponse responseBody = (sfdNewHiresSuccessResponse) JSON.deserialize(res.getBody(), sfdNewHiresSuccessResponse.class);
            System.debug(responseBody);
            updateCandidateNewHireId(app.Candidate__c, responseBody.id);
        } catch(System.CalloutException ex){
            System.debug('Callout Error: ' + ex);
            System.debug(res.getStatus());
            System.debug(res.getBody());
        }
    }
    
    public static void updateCandidateNewHireId(string candidateId, integer newHiresId){
        Candidate__c candidate = [SELECT SFD_New_Hires_ID__c FROM Candidate__c WHERE Id =:candidateId LIMIT 1];
        candidate.SFD_New_Hires_ID__c = string.valueOf(newHiresId);
        update candidate;
    }
    
    public class Employee {
        public string name;
        public string phone;
        public string mobile;
        public string hire_date;
        public string position;
        public string location;
        public string functional_area;
        public string job_level;
        public string type;
        public string email;
        
        public Employee(){}
        
        public Employee(string name, string phone, string mobile, string hire_date, string position, string location, string functional_area, string job_level, string type, string email){
            this.name = name;
            this.phone = phone;
            this.mobile = mobile;
            this.hire_date = hire_date;
            this.position = position;
            this.location = location;
            this.functional_area = functional_area;
            this.job_level = job_level;
            this.type = type;
            this.email = email;
        }
    }
    
    public class sfdNewHiresSuccessResponse {
        public string status;
        public string message;
        public integer id;
    }
}