public with sharing class SObjectDescriptionsController {
	public Map<String, Schema.SObjectType> gd;
	public String selectedObject;
	public String filterString {get; set;}

	public SObjectDescriptionsController() {
		gd = Schema.getGlobalDescribe();
		filterString = '';
	}

	public List<SelectOption> getObjects(){
		if((filterString != '') && (filterString.length() > 2)){
			return mapToSelect(filterOptions());
		}
		else{
			return mapToSelect(gd);
		}
		// List<SelectOption> objects = new List<SelectOption>();
		// for(String obj : gd.keySet()){
		// 	objects.add(new SelectOption(obj, obj));
		// }
		// return objects;
	}

	public String getSelectedObject(){
		return selectedObject;
	}

	public void setSelectedObject(String obj){
		this.selectedObject = obj;
	}

	private List<SelectOption> mapToSelect(Map<String, Schema.SObjectType> m){
		List<SelectOption> options = new List<SelectOption>();

		for(String s : m.keySet()){
			options.add(new SelectOption(s, s));
		}

		return options;
	}

	private Map<String, Schema.SObjectType> filterOptions(){
		Map<String, Schema.SObjectType> filteredGD = new Map<String, Schema.SObjectType>();
		for(String obj : gd.keySet()){
			if(obj.contains(filterString)){
				filteredGD.put(obj, gd.get(obj));
			}
		}
		return filteredGD;
	}

}