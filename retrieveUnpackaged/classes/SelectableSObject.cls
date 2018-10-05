public with sharing class SelectableSObject {
	private SObject record;
	public Boolean selected { get;set; }
	public Boolean recordExists { get;set; }

	public SelectableSObject(SObject obj) {
		record = obj;
		selected = false;
		recordExists = false;
	}
		//Getter for Employment_Website__c
	public Employment_Website__c getEmploymentWebsite(){
		return (Employment_Website__c)record;
	}
}