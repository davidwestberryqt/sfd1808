public class Weather {
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

	public class Hourly {
		public String summary {get;set;} 
		public String icon {get;set;} 

		public Hourly(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'summary') {
							summary = parser.getText();
						} else if (text == 'icon') {
							icon = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Hourly consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Currently {
		public Integer current_time {get;set;} 
		public String summary {get;set;} 
		public String icon {get;set;} 
		public Integer nearestStormDistance {get;set;} 
		public Integer nearestStormBearing {get;set;} 
		public Integer precipIntensity {get;set;} 
		public Integer precipProbability {get;set;} 
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

		public Currently(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
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
						} else if (text == 'nearestStormBearing') {
							nearestStormBearing = parser.getIntegerValue();
						} else if (text == 'precipIntensity') {
							precipIntensity = parser.getIntegerValue();
						} else if (text == 'precipProbability') {
							precipProbability = parser.getIntegerValue();
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
							System.debug(LoggingLevel.WARN, 'Currently consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Daily {
		public String summary {get;set;} 
		public String icon {get;set;} 

		public Daily(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'summary') {
							summary = parser.getText();
						} else if (text == 'icon') {
							icon = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Daily consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public Double latitude {get;set;} 
	public Double longitude {get;set;} 
	public String timezone {get;set;} 
	public Integer offset {get;set;} 
	public Currently currently {get;set;} 
	public Minutely minutely {get;set;} 
	public Hourly hourly {get;set;} 
	public Daily daily {get;set;} 
	public List<Alerts> alerts {get;set;} 

	public Weather(JSONParser parser) {
		while (parser.nextToken() != JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != JSONToken.VALUE_NULL) {
					if (text == 'latitude') {
						latitude = parser.getDoubleValue();
					} else if (text == 'longitude') {
						longitude = parser.getDoubleValue();
					} else if (text == 'timezone') {
						timezone = parser.getText();
					} else if (text == 'offset') {
						offset = parser.getIntegerValue();
					} else if (text == 'currently') {
						currently = new Currently(parser);
					} else if (text == 'minutely') {
						minutely = new Minutely(parser);
					} else if (text == 'hourly') {
						hourly = new Hourly(parser);
					} else if (text == 'daily') {
						daily = new Daily(parser);
					} else if (text == 'alerts') {
						alerts = new List<Alerts>();
						while (parser.nextToken() != JSONToken.END_ARRAY) {
							alerts.add(new Alerts(parser));
						}
					} else {
						System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Minutely {
		public String summary {get;set;} 
		public String icon {get;set;} 
		public List<Data> data {get;set;} 

		public Minutely(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'summary') {
							summary = parser.getText();
						} else if (text == 'icon') {
							icon = parser.getText();
						} else if (text == 'data') {
							data = new List<Data>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								data.add(new Data(parser));
							}
						} else {
							System.debug(LoggingLevel.WARN, 'Minutely consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Data {
		public Integer current_time {get;set;} 
		public Integer precipIntensity {get;set;} 
		public Integer precipProbability {get;set;} 
		public Double precipIntensityError {get;set;} 
		public String precipType {get;set;} 

		public Data(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'time') {
							current_time = parser.getIntegerValue();
						} else if (text == 'precipIntensity') {
							precipIntensity = parser.getIntegerValue();
						} else if (text == 'precipProbability') {
							precipProbability = parser.getIntegerValue();
						} else if (text == 'precipIntensityError') {
							precipIntensityError = parser.getDoubleValue();
						} else if (text == 'precipType') {
							precipType = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Data consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Alerts {
		public String title {get;set;} 
		public Integer current_time {get;set;} 
		public Integer expires {get;set;} 
		public String description {get;set;} 
		public String uri {get;set;} 

		public Alerts(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'title') {
							title = parser.getText();
						} else if (text == 'time') {
							current_time = parser.getIntegerValue();
						} else if (text == 'expires') {
							expires = parser.getIntegerValue();
						} else if (text == 'description') {
							description = parser.getText();
						} else if (text == 'uri') {
							uri = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Alerts consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static Weather parse(String json) {
		return new Weather(System.JSON.createParser(json));
	}
}