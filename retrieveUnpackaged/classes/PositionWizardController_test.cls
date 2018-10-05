@isTest
public class PositionWizardController_test {
    static PositionWizardController ctrl;
    static Position__c position;
    static Employment_Website__c testSite;
    
    public static void init(){
        position = new Position__c(name = 'Sr Test Developer');
        testSite = new Employment_Website__c(Name = 'Job Fair', Maximum_Budget__c = 200.00, Price_Per_Post__c = 5.00, Web_Address__c = 'www.example.com');
        insert position;
        insert testSite;
        ctrl = new PositionWizardController();
    }
    
    public static testMethod void moveToPage2(){
        PageReference page1 = Page.positionStep1;
        Test.setCurrentPage(page1);
        init();
        ctrl.setPosition(position);
        String nextPage = ctrl.step2().getUrl();
        System.assertEquals('/apex/positionstep2', nextPage);
    }
    
    public static testMethod void moveToPage3(){
        //Employment_Website__c site = new Employment_Website__c(Name = 'Job Fair', Maximum_Budget__c = 200.00, Price_Per_Post__c = 5.00, Web_Address__c = 'www.example.com');
        //insert site;
        
        PageReference page2 = Page.positionStep2;
        Test.setCurrentPage(page2);
        init();
        SelectOption[] sites = ctrl.allEmploymentWebsites;
        SelectOption[] selectedSites = new List<SelectOption>();

        selectedSites.add(sites[0]);
        ctrl.selectedEmploymentWebsites = selectedSites;
        String nextPage = ctrl.step3().getUrl();
        
        System.assertEquals(ctrl.getSelectedWebsitesList()[0].Name, testSite.Name);
        System.assertEquals('/apex/positionstep3', nextPage);
    }
    
    public static testMethod void createPositionAndLinkWebsites(){
        PageReference page1 = Page.positionStep1;
        Test.setCurrentPage(page1);
        init();
        
    }
    
    public static testMethod void moveToPreviousPage(){
        PageReference page2 = Page.positionStep2;
        Test.setCurrentPage(page2);
        init();
        String previousPage = ctrl.step1().getUrl();
        System.assertEquals('/apex/positionstep1', previousPage);
    }
    
    public static testMethod void cancel(){
        PageReference page1 = Page.positionStep1;
        Test.setCurrentPage(page1);
        init();
        String cancelPage = ctrl.cancel().getUrl();
        System.assertEquals('/home/home.jsp', cancelPage);
    }
}