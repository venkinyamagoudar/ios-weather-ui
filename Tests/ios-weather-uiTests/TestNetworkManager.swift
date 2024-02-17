//
//  TestNetworkManager.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/17/24.
//

import XCTest
@testable import ios_weather_ui

final class TestNetworkManager: XCTestCase {
    
    var networkManager: NetworkManager!
    
    let mockJsonString = """
        {
            "location": {
                "name": "London",
                "region": "City of London, Greater London",
                "country": "United Kingdom",
                "lat": 51.52,
                "lon": -0.11,
                "tz_id": "Europe/London",
                "localtime_epoch": 1708095830,
                "localtime": "2024-02-16 15:03"
            },
            "current": {
                "last_updated_epoch": 1708095600,
                "last_updated": "2024-02-16 15:00",
                "temp_c": 11,
                "temp_f": 51.8,
                "is_day": 1,
                "condition": {
                    "text": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                    "code": 1003
                },
                "wind_mph": 9.4,
                "wind_kph": 15.1,
                "wind_degree": 250,
                "wind_dir": "WSW",
                "pressure_mb": 1017,
                "pressure_in": 30.03,
                "precip_mm": 0,
                "precip_in": 0,
                "humidity": 76,
                "cloud": 50,
                "feelslike_c": 9,
                "feelslike_f": 48.1,
                "vis_km": 10,
                "vis_miles": 6,
                "uv": 3,
                "gust_mph": 14.1,
                "gust_kph": 22.8
            },
            "forecast": {
                "forecastday": [
                    {
                        "date": "2024-02-16",
                        "date_epoch": 1708041600,
                        "day": {
                            "maxtemp_c": 11.8,
                            "maxtemp_f": 53.3,
                            "mintemp_c": 8.7,
                            "mintemp_f": 47.6,
                            ...
                        }
                    },
                    ...
                ]
            }
        }
        """
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    // Test parsing JSON data into DailyPrediction object
    func test_ParseJsonData_UsingMock() {
        let jsonData = Data(mockJsonString.utf8)
        
        networkManager.parseJsonData(jsonData: jsonData) { result in
            switch result {
            case .success(let prediction):
                // Compare the parsed prediction with expected values
                XCTAssertEqual(prediction.location.name, "London")
                XCTAssertEqual(prediction.current.tempC, 11)
                // Add more assertions as needed
            case .failure(let error):
                XCTFail("Failed to parse JSON data: \(error.localizedDescription)")
            }
        }
    }
    
    func test_ExtractJsonData_JsonDataNotNil() {
        let expectation = self.expectation(description: "JSON data extraction")
        let url = "https://api.weatherapi.com/v1/forecast.json?key=caa3496acf20492683e152918241502&q=London&days=10&aqi=no&alerts=no"
        
        networkManager.extractJsonData(from: url) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Failed to extract JSON data: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
