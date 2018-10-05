public with sharing class AccountWithContacts {

	private final Account currentAccount;
	public Id deleteId {get; set;}

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public AccountWithContacts(ApexPages.StandardController stdController) {
        this.currentAccount = (Account)stdController.getRecord();
    }

	public PageReference newContact(){
		// String redirectUrl = '/003/e?';
		// redirectUrl = redirectUrl + 'retUrl=' + ApexPages.currentPage().getUrl();
		// redirectUrl = redirectUrl + '&accId=' + ApexPages.currentPage().getParameters().get('id');
		// System.debug('Redirect to ' + redirectUrl + ' to create a new Contact');
		// PageReference pageRef = new PageReference(redirectUrl);
		// //pageRef.setRedirect(true);
		// return pageRef;
		return null;
	}

	public PageReference deleteContact(){
		System.debug('Delete contact with Id ' + deleteId);

		Contact delCon = new Contact(Id = deleteId);
		Delete delCon;

		PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
		pageRef.setRedirect(true);

		return pageRef;
	}
}