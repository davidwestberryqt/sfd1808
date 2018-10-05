public with sharing class MultiSelectExtension {

	private ApexPages.StandardSetController standardController;

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public MultiSelectExtension(ApexPages.StandardSetController stdController) {
        this.standardController = stdController;
    }

    public List<Account> getAcctList() {
        return (List<Account>) standardController.getSelected();
    }
}