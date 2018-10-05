trigger acctTrigger on Account (Before Delete) {
    new AccountTriggerHandler().run();
}