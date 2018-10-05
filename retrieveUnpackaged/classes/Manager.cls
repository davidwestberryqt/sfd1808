public class Manager extends Employee {
	public List<Employee> subordinates;
    
    public Manager(string fname, string lname, string ssn, integer age, decimal hourlyRate){
        super(fname, lname, ssn, age, hourlyRate);
		
        this.subordinates = new List<Employee>();
    }
    
    public void addSubordinate(Employee e){
        subordinates.add(e);
    }
    
    public void removeSubordinate(Employee e){
        for(integer i = 0; i < subordinates.size(); i++){
            if(subordinates[i].getSSN() == e.getSSN()){
                subordinates.remove(i);
            }
        }
    }
    
    public void removeSubordinate(String ssn){
        for(integer i = 0; i < subordinates.size(); i++){
            if(subordinates[i].getSSN() == ssn){
                subordinates.remove(i);
            }
        }
    }
}