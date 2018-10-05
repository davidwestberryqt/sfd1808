public virtual class Employee {
    /*
     * Public Member Variables
     */
    public string firstName;
    public string lastName;
    public string title;
    public integer age;    
    public Date hireDate;
    public string address;
    public string phoneNumber;    
    public string email;
    public id employeeId;
    
    /*
     * Private Member Variables
     */
    private string ssn;
    private decimal hourlyRate;
    
    private Employee(){}
    
    public Employee(string fname, string lname, string ssn, integer age, decimal hourlyRate){
        this.firstName = fname;
        this.lastName = lname;
        this.ssn = ssn;
        this.age = age;
        this.hourlyRate = hourlyRate;
    }
    
    public Employee(String ssn, decimal rate){
        this.hourlyRate = rate;
        this.ssn = ssn;
    }
    
    public string getFullName(){
        return firstName + ' ' + lastName;
    }
    
    public virtual string getSSN(){
        return this.ssn;
    }
    
    public string getHourlyRate(){
        return string.valueOf(this.hourlyRate);
    }
    
    public void setHourlyRate(Decimal rate){
        hourlyRate = rate;
    }
    
    public void giveRaise(decimal pct){
        this.hourlyRate = hourlyRate * (1 + pct);
    }
    
    public void changeManager(Manager old, Manager newManager){
        old.removeSubordinate(this);
       	newManager.addSubordinate(this);
    }
    
    public static List<Candidate__c> candidateSearch(String s){
        String match = '%' + s + '%';
        return [SELECT First_Name__c, Last_Name__c, Phone__c FROM Candidate__c WHERE First_Name__c LIKE :match OR Last_Name__c LIKE :match];
    }
}