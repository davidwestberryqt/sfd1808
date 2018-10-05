trigger AutoCreateInterviewer on Position__c (before insert,after insert) {
    if (trigger.isAfter && trigger.isInsert){
        List<Interviewer__c> interviewers = new List<Interviewer__c>();
        for (Position__c newPosition: Trigger.New) {
            if (newPosition.Hiring_Manager__c != null) {
                interviewers.add(new Interviewer__c(
                    Name = '1',
                    Position__c = newPosition.Id,
                    Employee__c = newPosition.Hiring_Manager__c,
                    Role__c = 'Managerial'));
            }
        }
        insert interviewers;
    }
}