@RestResource(urlMapping='/RestDemo')
global class RESTDemo {
    
    @HttpGet
    global static Account getAccount(){
        RestRequest req = RestContext.request;
        Id AccountID = req.params.get('id');
        try{
            Account acc = [SELECT Id, Name, (Select FirstName, LastName FROM Contacts) FROM Account WHERE Id = :AccountID LIMIT 1];
            return acc;
        } catch(exception e){
            system.debug(e);
            return null;
        }
    }
    
    @HttpPost
    global static String addAccount(String accountName){
        System.debug(accountName);
        Account acct = new Account();
        acct.Name = accountName;
        insert acct;
        return 'Done';
    }
}