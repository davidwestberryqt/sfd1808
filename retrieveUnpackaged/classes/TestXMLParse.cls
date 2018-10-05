public class TestXMLParse {
	private string XMLString;
    private List<QBaseRecord> records;
    
    public TestXMLParse(){
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'QuickbaseXML' LIMIT 1];
        XMLString = sr.Body.toString();
        records = new List<QBaseRecord>();
    }
    
    public void parseTest(){
        Dom.Document doc = new Dom.Document();
        try {
            doc.load(XMLString);
            Dom.XmlNode rootNode = doc.getRootElement();
            parseNode(rootNode);
            //System.debug(rootNode.getChildElements());
        } catch(Exception e){
            System.debug(e.getMessage());
        }
    }
    
    public void parseNode(DOM.XmlNode node){
        if(node.getNodeType() == DOM.XmlNodeType.ELEMENT){
            //system.debug(node.getName());
            if(node.getName() == 'record'){
                records.add(new QBaseRecord(node));
            }
        }
        for (DOM.XmlNode child : node.getChildElements()){
            system.debug(child.getName());
            if(child.getName() == 'record'){
                records.add(new QBaseRecord(child));
            }
        }
        system.debug(records.size());
        system.debug(records[0].record_id);
    }
    
    public class QBaseRecord {
        public String record_id;
        public String copied_complete;
        public String task_name;
        public String convenience_outlets;
        public String media_players_installed;
        public String site_visits;
        public String techs;
        public String additional_materials_billed;
        public String additional_materials_description;
        public String after_hours;
        public String billable_hours;
        public String billable_overage_time;
        public String cancellation_billed;
        public String cancellation_details;
        public String cancellations;
        public String check_in_by;
        public String check_out_by;
        public String completed_datetime;
        public String convenience_outlet_details;
        public String convenience_outlets_billed;
        public String customer_facing_task_status_notes;
        public String deliverables_received;
        public String deliverables_received_by;
        public String deliverables_received_when;
        public String expedite;
        public String expedite_billed;
        public String expedites_details;
        public String initial_base_hours;
        public String install_notes;
        public String install_tech_check_in;
        public String install_tech_check_out;
        public String labor_base_billed;
        public String labor_overages_billed;
        public String no_visit;
        public String revisit;
        public String site_est_install_time;
        public String site_number;
        public String store_mgr_signature_received;
        public String store_mgr_signature_received_by;
        public String store_mgr_signature_received_when;
        public String task_status;
        public String total_base_hours;
        public String total_labor_billed;
        public String total_materials_billed;
        public String total_on_site_billed;
        public String total_tech_hours_on_site;
        public String lift_days;
        public String lift_billed_h;
        public String lift_details;
        public String cat5_cable_runs;
        public String cable_run_time;
        public String cable_run_materials_billed;
        public String covergent_overages_details;
        public String covergent_billable_overages;
        public String t_mobile_overages_details;
        public String t_mobile_billable_overages;
        public String date_modified;
        public String local_scheduled_time;
        public String site_number_of_screens;
        public String task_time_zone;
        public String billing_status;
		public String billing_assigned_to;
		public String billing_scheduled_time;
        public String update_id;
        
        public QBaseRecord(Dom.XmlNode node){
            system.debug('Creating new Record');
            system.debug(node.getName());
            for(Dom.XmlNode field : node.getChildElements()){
                switch on field.getName() {
                    when 'record_id_' {
                        this.record_id = field.getText().trim();
                    }
                    when 'copied_complete' {
                        this.copied_complete = field.getText().trim();
                    }
                    when 'task_name'{
                        this.task_name = field.getText().trim();
                    }
                    when '___of_convenience_outlets'{
                        
                    }
                    when '___of_media_players_installed'{
                        
                    }
                    when '___of_site_visits' {
                        
                    }
                    when '___of_techs'{
                        
                    }
                    when 'additional_materials_billed'{
                        
                    }
                    when 'additional_materials_description'{
                        
                    }
                    when 'after_hours_'{
                        
                    }
                    when 'billable_hours'{
                        
                    }
                    when 'billable_overage_time'{
                        
                    }
                    when 'cancellation_billed'{
                        
                    }
                    when 'cancellation_details'{
                        
                    }
                    when 'cancellations'{
                        
                    }
                    when 'check_in_by'{
                        
                    }
                    when 'check_out_by'{
                        
                    }
                    when 'completed_date_and_time'{
                        
                    }
                    when 'convenience_outlet_details'{
                        
                    }
                    when 'convenience_outlets_billed'{
                        
                    }
                    when 'customer_facing_task_status_notes'{
                        
                    }
                    when 'deliverables_received'{
                        
                    }
                    when 'deliverables_received_by'{
                        
                    }
                    when 'deliverables_received_when'{
                        
                    }
                    when 'expedite_'{
                        
                    }
                    when 'expedite_billed'{
                        
                    }
                    when 'expedites_details'{
                        
                    }
                    when 'initial_base_hours'{
                        
                    }
                    when 'install_notes'{
                        
                    }
                    when 'install_tech_check_in'{
                        
                    }
                    when 'install_tech_check_out'{
                        
                    }
                    when 'labor_base_billed'{
                        
                    }
                    when 'labor_overages_billed'{
                        
                    }
                    when 'no_visit_'{
                        
                    }
                    when 'revisit_'{
                        
                    }
                    when 'site___est__install_time'{
                        
                    }
                    when 'site_number'{
                        this.site_number = field.getText().trim();
                    }
                    when 'store_mgr_signature_received'{
                        
                    }
                    when 'store_mgr_signature_received_by'{
                        
                    }
                    when 'store_mgr_signature_received_when'{
                        
                    }
                    when 'task_status'{
                        
                    }
                    when 'total_base_hours'{
                        
                    }
                    when 'total_labor_billed'{
                        
                    }
                    when 'total_materials_billed'{
                        
                    }
                    when 'total_on_site_billed'{
                        
                    }
                    when 'total_tech_hours_on_site'{
                        
                    }
                    when 'lift_days'{
                        
                    }
                    when 'lift_billed__h_'{
                        
                    }
                    when 'lift_details'{
                        
                    }
                    when '___of_cat5e_cable_runs'{
                        
                    }
                    when 'cable_run_time'{
                        
                    }
                    when 'cable_run_materials_billed'{
                        
                    }
                    when 'covergent_overages_details'{
                        
                    }
                    when 'covergent_billable_overages'{
                        
                    }
                    when 't_mobile_overages_details'{
                        
                    }
                    when 't_mobile_billable_overages'{
                        
                    }
                    when 'date_modified'{
                        
                    }
                    when 'local_scheduled_time'{
                        
                    }
                    when 'site_____of_screens'{
                        
                    }
                    when 'task_time_zone'{
                        
                    }
                    when 'billing_status'{
                        
                    }
                    when 'billing_assigned_to'{
                        
                    }
                    when 'billing_scheduled_time'{
                        
                    }
                    when 'update_id'{
                        
                    }
                    when else {
                        system.debug('Field ' + field.getName() + ' was not recognized.');
                    }
                }
            }
        }
    }
}