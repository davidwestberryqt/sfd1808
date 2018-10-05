public with sharing class PositionListExtension {
    public transient List<Position__c> filteredPositions {get; set;}
    public String selectedLocation {get; set;}
    public String selectedStatus {get; set;}
    
    public PositionListExtension(ApexPages.StandardSetController ctl){
        filteredPositions = [SELECT Name, Location__c, Job_Description__c, Travel_Required__c, Status__c
                             FROM Position__c 
                             WHERE Id IN :ctl.getRecords()
                            ];
    }
    
    public List<SelectOption> getLocationOptions(){
        return getPicklistOptions('Location__c');
    }
    
    public List<SelectOption> getStatusOptions(){
        return getPicklistOptions('Status__c');
    }
    
    public PageReference applyFilters(){
        String q = 'SELECT Name, Location__c, Job_Description__c, Travel_Required__c, Status__c FROM Position__c';
        String filters = '';
        
        if(String.isNotBlank(selectedLocation)){
            if(filters != ''){
                filters += ' AND ';
            }
            filters += 'Location__c = :selectedLocation';
        }
        if(selectedStatus != '' && selectedStatus != null){
            if(filters != ''){
                filters += ' AND ';
            }
            
            filters += 'Status__c = :selectedStatus';
        }
        
        if(filters != ''){
            q += ' WHERE ';
            q += filters;
        }
        
        System.debug(q);
        filteredPositions = Database.query(q);
        //filteredPositions = [SELECT Name, Location__c, Job_Description__c, Travel_Required__c, Status__c
        //                     FROM Position__c 
        //                     WHERE Location__c = :selectedLocation AND Status__c = :selectedStatus];
        
        return null;
    }
    
    public List<SelectOption> getPicklistOptions (String fieldName){
        List<SelectOption> options = new List<SelectOption>();
        Map<String, Schema.SObjectField> fieldMap = SObjectType.Position__c.fields.getMap();
        
        //Schema.DescribeFieldResult locationField = SObjectType.Position__c.fields.Location__c;
        
        Schema.SObjectField locationField = fieldMap.get(fieldName);
        List<PickListEntry> entries = locationField.getDescribe().getPicklistValues();
        options.add(new SelectOption('', 'All'));
        for(PickListEntry e : entries){
            options.add(new SelectOption(e.getValue(), e.getLabel()));
        }
        
        return options;
    }
}