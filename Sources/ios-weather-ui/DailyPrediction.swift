//
//  DailyPrediction.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 01/15/24.
//

import Foundation

// MARK: - DailyPrediction
public struct DailyPrediction: Codable {
    public let location: Location
    public let current: Current
    public let forecast: Forecast
}

// MARK: - Location
public struct Location: Codable {
    public let name, region, country: String
    public let lat, lon: Double
//    let localtime: String
    
    public enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
//        case localtime
    }
}

// MARK: - Current
public struct Current: Codable {
    public let lastUpdatedEpoch: Int
    public let lastUpdated: String
    public let tempC: Double
    public let tempF: Double
    public let isDay: Int
    public let condition: Condition
    public let windMph, windKph: Double
    public let windDegree: Double
    public let windDir: String
    public let humidity: Double
    public let pressure: Double
    
    public enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case humidity
        case pressure = "pressure_mb"
    }
}


// MARK: - Forecast
public struct Forecast: Codable {
    public let forecastday: [Forecastday]
}

// MARK: - Forecastday
public struct Forecastday: Codable {
    public let date: String
    public let day: Day
    
    public enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}

// MARK: - Day
public struct Day: Codable {
    public let maxtempC, maxtempF, mintempC, mintempF: Double
    public let maxwindMph, maxwindKph: Double
    public let condition: Condition
    
    public enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case condition
    }
}

// MARK: - Condition1
public struct Condition: Codable {
    public let text: String
}
