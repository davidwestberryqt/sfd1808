public class SortableListExtension {
    public final String ASCSTRING = ' ASC';
    public final String DESCSTRING = ' DESC';
    public String sortBy = 'LastName';
    public String sortOrder = ASCSTRING;
    
    public SortableListExtension(ApexPages.StandardSetController setCon){
        
    }
    
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                setCon = new ApexPages.StandardSetController(getEligibilities());
            }
            return setCon;
        }
        set;
    }
    
    public List<Contact> getEligibilities(){
        String query = 'SELECT Id, FirstName, LastName, Phone, MailingStreet FROM Contact ORDER BY ' + this.sortBy + this.sortOrder;
        System.debug('>>>>> query: ' + query);
        return Database.query(query);
    }
    
    public void sortByLastName(){
        if(sortBy == 'LastName'){
            if(sortOrder == ASCSTRING){
                sortOrder = DESCSTRING;
            } else {
                sortOrder = ASCSTRING;
            }
        } else {
            this.sortBy = 'LastName';
            this.sortOrder = ASCSTRING;
        }
        System.debug('>>>>>> sortBy: ' + sortBy);
        System.debug('>>>>>> sortOrder: ' + sortOrder);
    }
    public void sortByFirstName(){
        if(sortBy == 'FirstName'){
            if(sortOrder == ASCSTRING){
                sortOrder = DESCSTRING;
            } else {
                sortOrder = ASCSTRING;
            }
        } else {
            this.sortBy = 'FirstName';
            this.sortOrder = ASCSTRING;
        }
        System.debug('>>>>>> sortBy: ' + sortBy);
        System.debug('>>>>>> sortOrder: ' + sortOrder);
    }
}