public class Location {
	public static void consumeObject(JSONParser parser) {
		Integer depth = 0;
		do {
			JSONToken curr = parser.getCurrentToken();
			if (curr == JSONToken.START_OBJECT || 
				curr == JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == JSONToken.END_OBJECT ||
				curr == JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}

	public String ip {get;set;} 
	public String hostname {get;set;} 
	public String city {get;set;} 
	public String region {get;set;} 
	public String country {get;set;} 
	public String loc {get;set;} 
	public String org {get;set;} 
	public String postal {get;set;} 

	public Location(JSONParser parser) {
		while (parser.nextToken() != JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != JSONToken.VALUE_NULL) {
					if (text == 'ip') {
						ip = parser.getText();
					} else if (text == 'hostname') {
						hostname = parser.getText();
					} else if (text == 'city') {
						city = parser.getText();
					} else if (text == 'region') {
						region = parser.getText();
					} else if (text == 'country') {
						country = parser.getText();
					} else if (text == 'loc') {
						loc = parser.getText();
					} else if (text == 'org') {
						org = parser.getText();
					} else if (text == 'postal') {
						postal = parser.getText();
					} else {
						System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	public static Location parse(String json) {
		return new Location(System.JSON.createParser(json));
	}
}