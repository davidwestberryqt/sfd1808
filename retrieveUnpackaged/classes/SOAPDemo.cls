global class SOAPDemo {
    webservice static String helloWorld() {
        return 'Hello World';
    }
    
    webservice static Account getAccountById(Id id){
        Account acct = [SELECT Id, Name FROM Account WHERE Id = :id LIMIT 1];
        return acct;
    }
    
    webservice static Id createAccount(String name){
        Account acct = new Account();
        acct.Name = name;
        insert acct;
        return acct.Id;
    }
}