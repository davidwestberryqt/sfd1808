public with sharing class DynamicFieldsLister {
    public String objType{get; set;}
    
    public DynamicFieldsLister(ApexPages.StandardController controller) {
        objType = controller.getRecord().getSObjectType().getDescribe().getName();
    }
    
    public List<String> getEditableFields(){
        List<String> objTypes = new List<String>{objType};
        List<String> editableFields = new List<String>();
        
        Schema.DescribeSObjectResult result = schema.describeSObjects(objTypes)[0];
        Map<String, Schema.SObjectField> M;
        M = result.fields.getMap();
        
        for(String fld : M.keySet()){
            Schema.SObjectField field = M.get(fld);
            if(field.getDescribe().isUpdateable()){
                editableFields.add(field.getDescribe().getName());
            }
        }
        
        return editableFields;
    }

}