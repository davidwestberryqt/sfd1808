public with sharing class FCMobileCaseStatusCtrl {
	public Application app {get; set;}

	public FCMobileCaseStatusCtrl() {
		app = new Application();
		// app.Head_of_Household_Name_c = 'Test Head Of Household';
		// app.Confirmation_Number_c =	'22000000070';
		// app.Application_Date_c = '2/1/2016';
		// app.App_Status_c = 'New';
		// app.Policy_Number_c = '123486098';
	}

	public class Application{
		public string Head_of_Household_Name_c;
		public string Confirmation_Number_c;
		public string Application_Date_c;
		public string App_Status_c;
		public string Policy_Number_c;

		public Application(){
			Head_of_Household_Name_c = 'Test Head Of Household';
			Confirmation_Number_c =	'22000000070';
			Application_Date_c = '2/1/2016';
			App_Status_c = 'New';
			Policy_Number_c = '123486098';
		}
	}
}