//
//  PredictionAndWeatherDetailViewModel.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/16/24.
//

import SwiftUI

@available(macOS 10.15, *)
public class PredictionAndWeatherDetailViewModel: ObservableObject {
    public var dailyPrediction: DailyPrediction?
    public var predictions: [Forecastday]
    
    /// Initializes the view model with the provided daily prediction data.
    /// - Parameter dailyPrediction: The daily weather prediction data.
    public init(dailyPrediction: DailyPrediction?) {
        self.dailyPrediction = dailyPrediction
        self.predictions = dailyPrediction?.forecast.forecastday ?? []
    }
    
    /// Description:Retrieves the image associated with the provided weather condition.
    /// Images are from this website https://worldweather.wmo.int/en/wxicons.html
    /// - Parameter condition: The weather condition for which to retrieve the image.
    /// - Returns: An `Image` object representing the weather condition.
    @available(macOS 11.0, *)
    public func getImage(for condition: String?) -> Image {
        guard let condition = condition else {
            return Image(systemName: "questionmark")
        }
        
        switch condition {
        case "Clear", "Fine", "Fair", "Bright", "Sunny":
            return Image("Daytime_Bright_Sunny_Fair_Fine_Clear", bundle: .module)
        case "Cloudy", "Mostly Cloudy":
            return Image("Cloudy", bundle: .module)
        case "Light drizzle", "Light rain", "Light rain shower":
            return Image("Light Showers", bundle: .module)
        case "Mist":
            return Image("Mist", bundle: .module)
        case "Moderate rain":
            return Image("Rain", bundle: .module)
        case "Overcast":
            return Image("Overcast", bundle: .module)
        case "Partly cloudy", "Sunny Periods", "Partly Bright", "Mild":
            return Image("Partly cloudy", bundle: .module)
        case "Patchy light drizzle", "Patchy light rain", "Patchy rain possible", "Patchy rain nearby":
            return Image("Occasional Showers_Scattered Showers", bundle: .module)
        case "Fog":
            return Image("Fog", bundle: .module)
        case "Blowing Snow", "Blizzard", "Snowdrift", "Snowstorm":
            return Image("Blowing Snow_Blizzard_Snowdrift_Snowstorm", bundle: .module)
        case "Cold", "Chilly", "Freezing", "Frost":
            return Image("Cold_Chilly_Freezing_Frost", bundle: .module)
        case "Cool":
            return Image("Cool", bundle: .module)
        case "Freezing Rain":
            return Image("Freezing Rain", bundle: .module)
        case "Hail":
            return Image("Hail", bundle: .module)
        case "Hot":
            return Image("Hot", bundle: .module)
        case "Isolated Showers":
            return Image("Isolated Showers", bundle: .module)
        case "Light Snow":
            return Image("Light Snow", bundle: .module)
        case "Occasional Showers", "Scattered Showers":
            return Image("Occasional Showers_Scattered Showers", bundle: .module)
        case "Rainy":
            return Image("Rain", bundle: .module)
        case "Sandstorm", "Duststorm", "Sand", "Dust":
            return Image("Sandsorm_Duststorm_Sand_Dust", bundle: .module)
        case "Showers", "Heavy Showers", "Rain Showers":
            return Image("Showers_Heavy Showers_Rainshower", bundle: .module)
        case "Sleet":
            return Image("Sleet", bundle: .module)
        case "Snow Showers", "Flurries":
            return Image("Snow Showers_Flurries", bundle: .module)
        case "Snow", "Heavy Snow", "Snowfall":
            return Image("Snow_Heavy Snow_Snowfall", bundle: .module)
        case "Thunder Rain":
            return Image("Thunder rain", bundle: .module)
        case "Thunderstorms", "Thundershowers", "Storm", "Lightning":
            return Image("Thunderstorms_Thundershowers_Storm_Lightning", bundle: .module)
        case "Warm":
            return Image("Warm", bundle: .module)
        case "Windy", "Squall", "Stormy", "Gale":
            return Image("Windy_Squall_Stormy_Gale", bundle: .module)
        default:
            return Image("Sunny", bundle: .module)
        }
    }
    
    /// Converts a decimal value to a string with two decimal places.
    /// - Parameter value: The decimal value to convert.
    /// - Returns: A string representation of the decimal value with two decimal places.
    public func convertDecimalToString(_ value: Double?) -> String {
        guard let value = value else {
            return ""
        }
        return String(format: "%.2f", value)
    }
    
    public func dayOfWeek(for dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        if Calendar.current.isDateInToday(date) {
            return "Today"
        } else {
            dateFormatter.dateFormat = "EEEE"
            let fullDayOfWeek = dateFormatter.string(from: date)
            let shortenedDayOfWeek = String(fullDayOfWeek.prefix(3))
            return shortenedDayOfWeek
        }
    }
}
