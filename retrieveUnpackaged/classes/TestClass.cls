@isTest
public class TestClass {
	static testMethod void verifyLeadOwner(){
        User Region2User = [SELECT id from USER WHERE LastName = 'Region2'][0];
        User Region1User = [SELECT id from USER WHERE LastName = 'Region1'][0];
        Lead region2Lead = new Lead();
        Lead region1Lead = new Lead();
        region2Lead.FirstName = 'TestLead';
        region2Lead.LastName = 'Region2';
        region2Lead.Company = 'TestCompany';
        region2Lead.PostalCode = '30188';
        region1Lead.FirstName = 'TestLead';
        region1Lead.LastName = 'Region1';
        region1Lead.Company = 'TestCompany';
        region1Lead.PostalCode = '30005';
        insert region2Lead;
        insert region1Lead;
        Lead insertedRegion1Lead = [select FirstName, LastName, OwnerId from Lead where id = :region1Lead.Id][0];
        Lead insertedRegion2Lead = [select FirstName, LastName, OwnerId from Lead where id = :region2Lead.Id][0];
        System.assertEquals(Region2User.Id, insertedRegion2Lead.OwnerId);
        System.assertEquals(Region1User.Id, insertedRegion1Lead.OwnerId);
    }
}