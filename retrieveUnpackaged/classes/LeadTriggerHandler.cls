public class LeadTriggerHandler extends TriggerHandler {
    public LeadTriggerHandler(){}
    protected override void beforeInsert(){
        handleBeforeInsert();
    }
    private static void handleBeforeInsert(){
        User Region2User = [SELECT id from USER WHERE LastName = 'Region2'][0];
        User Region1User = [SELECT id from USER WHERE LastName = 'Region1'][0];
        for(Lead l: (List<Lead>) trigger.new){
            string zipcode = l.PostalCode;
            if(zipcode == '30188'){
                l.OwnerId = Region2User.Id;
            }
            else{
                l.OwnerId = Region1User.Id;
            }
        }
    }    
}