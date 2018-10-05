global with sharing class CheckRecruitingAppController {
    public Boolean appExists{get; set;}
    
    @RemoteAction
    global static boolean checkApp(){
        boolean appExists = false;
        List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
        
        for(DescribeTabSetResult tsr: tabSetDesc){
            String appLabel = tsr.getLabel();
            if(appLabel == 'Recruiting'){
                System.debug('Found Recruiting App');
                appExists = true;
                break;
            }
        }
        if(!appExists){
            System.debug('Recruiting App was not found in this org');
        }
        return appExists;
    }
    
    //@RemoteAction
    //global static boolean checkPosition(){
    //    return checkObject('position__c');
        /*
        boolean positionOk = true;
        Map<String, Schema.SObjectType> objects = Schema.getGlobalDescribe();
        
        List<String> sObjectTypes = new string[]{'position__c'};
        Schema.DescribeSObjectResult[] results = Schema.describeSObjects(sObjectTypes);
        
        for(Schema.DescribeSObjectResult res : results){
            Map<String, Schema.SObjectField> fieldsMap;
            fieldsMap = res.fields.getMap();
            for(string fld : CheckRecruitingAppUtility.positionFields){
                Schema.SObjectField field = fieldsMap.get(fld);
                if(field == null){
                    positionOk = false;
                    break;
                }
                System.debug('Field ' + fld + ' of type ' + field.getDescribe().getType() + ' exists in the current org');
            }
        }
        
        return positionOk;
                */
    //}
    
    @RemoteAction
    global static object checkObject(string objectName){
        boolean objectOk = true;
        List<String> failedFields = new List<string>();
        Map<String, Schema.SObjectType> objects = Schema.getGlobalDescribe();
        
        List<String> sObjectTypes = new string[]{objectName};
        Schema.DescribeSObjectResult[] results = Schema.describeSObjects(sObjectTypes);
        
        for(Schema.DescribeSObjectResult res : results){
            Map<String, Schema.SObjectField> fieldsMap;
            fieldsMap = res.fields.getMap();
            List<string> fieldList = CheckRecruitingAppUtility.objectToFieldsMap.get(objectName);
            for(string fld : fieldList){
                Schema.SObjectField field = fieldsMap.get(fld);
                if(field == null){
                    objectOk = false;
                    System.debug(fld + ' does not exist on object ' + res.getLabel());
                    failedFields.add(fld);
                    continue;
                }
                System.debug('Field ' + fld + ' of type ' + field.getDescribe().getType() + ' exists in the current org');
            }
        }
        
        return new Result(objectOk, failedFields);
    }
    class Result {
        public boolean status;
        public List<String> failures;
        public Result(boolean status, List<string> failures){
            this.status = status;
            this.failures = failures;
        }
    }
}