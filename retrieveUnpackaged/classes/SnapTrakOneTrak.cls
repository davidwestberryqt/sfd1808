public class SnapTrakOneTrak {
    public class Status 
    {
        public String Code;
        public String Description;
        public String RelatedField;
        public Integer Row;
        private String[] Code_type_info = new String[]{'Code','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] Description_type_info = new String[]{'Description','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] RelatedField_type_info = new String[]{'RelatedField','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] Row_type_info = new String[]{'Row','http://snaptrack.dhs.state.nj.us/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/','true','false'};
        private String[] field_order_type_info = new String[]{'Code','Description','RelatedField','Row'};
    }
    public class StatusOut extends SnapTracBase
    {
        public SnapTrakOneTrak.ArrayOfStatus StatusList;
        private String[] StatusList_type_info = new String[]{'StatusList','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/','true','false'};
        private String[] field_order_type_info = new String[]{'StatusList'};
    }
    public virtual class SnapTracBase 
    {
        public String UniqueID;
        public Integer SignedOnOfficeIdno;
        public String ServiceScreenID;
        public String ServiceScreenFunctionID;
        public String ServiceMethodName;
        public String ClientAddr;
        private String[] UniqueID_type_info = new String[]{'UniqueID','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] SignedOnOfficeIdno_type_info = new String[]{'SignedOnOfficeIdno','http://snaptrack.dhs.state.nj.us/',null,'1','1','false'};
        private String[] ServiceScreenID_type_info = new String[]{'ServiceScreenID','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] ServiceScreenFunctionID_type_info = new String[]{'ServiceScreenFunctionID','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] ServiceMethodName_type_info = new String[]{'ServiceMethodName','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] ClientAddr_type_info = new String[]{'ClientAddr','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/','true','false'};
        private String[] field_order_type_info = new String[]{'UniqueID','SignedOnOfficeIdno','ServiceScreenID','ServiceScreenFunctionID','ServiceMethodName','ClientAddr'};
    }
    public class IncomingNJoneAppInData 
    {
        public String XmlInText;
        public String ApplicationIdno;
        private String[] XmlInText_type_info = new String[]{'XmlInText','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
            private String[] ApplicationIdno_type_info = new String[]{'ApplicationIdno','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/','true','false'};
                    private String[] field_order_type_info = new String[]{'XmlInText','ApplicationIdno'};
                        }
    public class AddDataToSnapTracResponse_element 
    {
        public SnapTrakOneTrak.StatusOut AddDataToSnapTracResult;
        private String[] AddDataToSnapTracResult_type_info = new String[]{'AddDataToSnapTracResult','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/','true','false'};
                private String[] field_order_type_info = new String[]{'AddDataToSnapTracResult'};
                    }
    public class AddDataToSnapTrac_element 
    {
        public SnapTrakOneTrak.IncomingNJoneAppInData input;
        private String[] input_type_info = new String[]{'input','http://snaptrack.dhs.state.nj.us/',null,'0','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/','true','false'};
                private String[] field_order_type_info = new String[]{'input'};
                    }
    public class ArrayOfStatus 
    {
        public SnapTrakOneTrak.Status[] Status;
        private String[] Status_type_info = new String[]{'Status','http://snaptrack.dhs.state.nj.us/',null,'0','-1','true'};
            private String[] apex_schema_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/','true','false'};
                private String[] field_order_type_info = new String[]{'Status'};
                    }
    public class IncomingNJoneAppSoap 
    {
        public String endpoint_x = 'https://wst1.state.nj.us/DHS_OneTrac';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://snaptrack.dhs.state.nj.us/', 'SnapTrakOneTrak'};
            
            public SnapTrakOneTrak.StatusOut AddDataToSnapTrac(SnapTrakOneTrak.IncomingNJoneAppInData input) 
        {
            SnapTrakOneTrak.AddDataToSnapTrac_element request_x = new SnapTrakOneTrak.AddDataToSnapTrac_element();
            request_x.input = input;
            SnapTrakOneTrak.AddDataToSnapTracResponse_element response_x;
            Map<String, SnapTrakOneTrak.AddDataToSnapTracResponse_element> response_map_x = new Map<String, SnapTrakOneTrak.AddDataToSnapTracResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                    'http://snaptrack.dhs.state.nj.us/AddDataToSnapTrac',
                    'http://snaptrack.dhs.state.nj.us/',
                    'AddDataToSnapTrac',
                    'http://snaptrack.dhs.state.nj.us/',
                    'AddDataToSnapTracResponse',
                    'SnapTrakOneTrak.AddDataToSnapTracResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.AddDataToSnapTracResult;
        }
    }
}