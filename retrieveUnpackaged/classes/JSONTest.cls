public class JSONTest {
	public List<Result> results;
    public Result result {
        get{
            return results[0];
        }
    }
    public String status;
    
    public class Result {
        public String formatted_address;
        public List<AddressComponent> address_components;
        public Geometry geometry;
        public String place_id;
        public String[] types;
    }
    
    public class AddressComponent{
        String long_name;
        String short_name;
        String[] types;
    }
    
    public class Geometry {
        public Location location;
        public String location_type;
        public Viewport viewport;
    }
    
    public class Viewport {
        public Location northeast;
        public Location southwest;
    }
    
    public class Location {
        public String lat;
        public String lng;
    }
}