public class NewHire {
	public String name;
    public String phone;
    public String mobile;
    public String hire_date;
    public String position;
    public String location;
    public String functional_area;
    public String job_level;
    public String type;
    public String email;
    
    public NewHire(Job_Application__c ja){
        this.name = ja.Candidate__r.Full_Name__c;
        this.phone = ja.Candidate__r.Phone__c;
        this.mobile = ja.Candidate__r.Mobile__c;
        this.hire_date = Date.today().format();
        this.position = ja.Position__r.Name;
        this.location = ja.Position__r.Location__c;
        this.functional_area = ja.Position__r.Functional_area__c;
        this.job_level = ja.Position__r.Job_Level__c;
        this.type = ja.Position__r.Type__c;
        this.email = ja.Candidate__r.Email__c;
    }
}