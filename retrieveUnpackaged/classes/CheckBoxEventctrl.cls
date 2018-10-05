public with sharing class CheckBoxEventctrl {
	public Contact hohCon {get; set;}
	public boolean inviteBtnEnabled {get; set;}

	public CheckBoxEventctrl(ApexPages.StandardController controller){
		inviteBtnEnabled = true;
		Contact currentCon = (Contact)controller.getRecord();
		hohCon = [SELECT Id, Name, Active__c FROM Contact WHERE Id = :currentCon.Id LIMIT 1];
	}
	public String param1{
		get;
		set{
			param1 = value;
		}
	}

	public void checked()
	{
		inviteBtnEnabled = false;
		if(hohCon.active__c){
			hohCon.active__c = true;
			update hohCon;
			System.debug('Updated ' + hohCon);
			inviteBtnEnabled = false;
		}
		else{
			system.debug('Button Disabled');
			inviteBtnEnabled = true;
		}
		system.debug('Parameter 1 value : '+ param1);
		system.debug('Checkbox Event Called');
	}

}