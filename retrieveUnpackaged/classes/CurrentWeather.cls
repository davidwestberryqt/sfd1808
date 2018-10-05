public class CurrentWeather {
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

	public Integer current_time {get;set;} 
	public String summary {get;set;} 
	public String icon {get;set;} 
	public Integer nearestStormDistance {get;set;} 
	public Double precipIntensity {get;set;} 
	public Double precipIntensityError {get;set;} 
	public Integer precipProbability {get;set;} 
	public String precipType {get;set;} 
	public Double temperature {get;set;} 
	public Double apparentTemperature {get;set;} 
	public Double dewPoint {get;set;} 
	public Double humidity {get;set;} 
	public Double windSpeed {get;set;} 
	public Integer windBearing {get;set;} 
	public Double visibility {get;set;} 
	public Double cloudCover {get;set;} 
	public Double pressure {get;set;} 
	public Double ozone {get;set;} 

	public CurrentWeather(JSONParser parser) {
		while (parser.nextToken() != JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getCurrentName() == 'currently') {
				String text = parser.getText();
				if (parser.nextToken() != JSONToken.VALUE_NULL) {
					if (text == 'time') {
						current_time = parser.getIntegerValue();
					} else if (text == 'summary') {
						summary = parser.getText();
					} else if (text == 'icon') {
						icon = parser.getText();
					} else if (text == 'nearestStormDistance') {
						nearestStormDistance = parser.getIntegerValue();
					} else if (text == 'precipIntensity') {
						precipIntensity = parser.getDoubleValue();
					} else if (text == 'precipIntensityError') {
						precipIntensityError = parser.getDoubleValue();
					} else if (text == 'precipProbability') {
						precipProbability = parser.getIntegerValue();
					} else if (text == 'precipType') {
						precipType = parser.getText();
					} else if (text == 'temperature') {
						temperature = parser.getDoubleValue();
					} else if (text == 'apparentTemperature') {
						apparentTemperature = parser.getDoubleValue();
					} else if (text == 'dewPoint') {
						dewPoint = parser.getDoubleValue();
					} else if (text == 'humidity') {
						humidity = parser.getDoubleValue();
					} else if (text == 'windSpeed') {
						windSpeed = parser.getDoubleValue();
					} else if (text == 'windBearing') {
						windBearing = parser.getIntegerValue();
					} else if (text == 'visibility') {
						visibility = parser.getDoubleValue();
					} else if (text == 'cloudCover') {
						cloudCover = parser.getDoubleValue();
					} else if (text == 'pressure') {
						pressure = parser.getDoubleValue();
					} else if (text == 'ozone') {
						ozone = parser.getDoubleValue();
					} else {
						System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	public static CurrentWeather parse(String json) {
		return new CurrentWeather(System.JSON.createParser(json));
	}
}