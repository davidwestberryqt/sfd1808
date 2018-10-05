public class RecordCreator {
    
    public static void createPosition(){
        Position__c position = new Position__c();
        position.Name = 'Software Developer';
        position.Location__c = 'Austin, TX';
        position.Functional_Area__c = 'Information Technology';
        insert position;
        System.debug('Position Inserted');
        System.debug(position);
        position.Status__c = 'Open - Approved';
        update position;
        System.debug(position);
        delete position;
        System.debug('Position Deleted');
        System.debug(position);
    }    
    
}