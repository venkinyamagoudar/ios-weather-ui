//
//  PredictionView.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/15/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct PredictionView: View {
    private var predictions: [Forecastday]
    
    public init(predictions: [Forecastday]) {
        self.predictions = predictions
    }
    
    public var body: some View {
        VStack {
            List(predictions, id: \.date) { prediction in
                HStack{
                    Text("\(prediction.date)")
                    if let conditionImage = getForecastedImage(condition: prediction.day.condition.text) {
                        conditionImage
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else {
                        Image(systemName: "questionmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                    }
                    Text("\(prediction.day.maxtempC)")
                    Text("\(prediction.day.mintempC)")
                }
            }
        }
    }
    
    /// Description:images are from this website https://worldweather.wmo.int/en/wxicons.html
    /// - Parameter condition: Condition that is predicted for the day
    /// - Returns: Image that is related to the condition
    func getForecastedImage(condition: String?) -> Image? {
        guard let condition = condition else {
            return nil
        }
        
        switch condition {
        case "Clear", "Fine", "Fair", "Bright", "Sunny":
            return Image("Daytime_Bright_Sunny_Fair_Fine_Clear", bundle: Bundle.module)
        case "Cloudy", "Mostly Cloudy":
            return Image("Cloudy", bundle: Bundle.module)
        case "Light drizzle", "Light rain", "Light rain shower":
            return Image("Light Showers", bundle: Bundle.module)
        case "Mist":
            return Image("Mist", bundle: Bundle.module)
        case "Moderate rain":
            return Image("Rain", bundle: Bundle.module)
        case "Overcast":
            return Image("Overcast", bundle: Bundle.module)
        case "Partly cloudy", "Sunny Periods", "Partly Bright", "Mild":
            return Image("Partly cloudy", bundle: Bundle.module)
        case "Patchy light drizzle", "Patchy light rain", "Patchy rain possible":
            return Image("Occasional Showers_Scattered Showers", bundle: Bundle.module)
        case "Fog":
            return Image("Fog", bundle: Bundle.module)
        case "Blowing Snow", "Blizzard", "Snowdrift", "Snowstorm":
            return Image("Blowing Snow_Blizzard_Snowdrift_Snowstorm", bundle: Bundle.module)
        case "Cold", "Chilly", "Freezing", "Frost":
            return Image("Cold_Chilly_Freezing_Frost", bundle: Bundle.module)
        case "Cool":
            return Image("Cool", bundle: Bundle.module)
        case "Freezing Rain":
            return Image("Freezing Rain", bundle: Bundle.module)
        case "Hail":
            return Image("Hail", bundle: Bundle.module)
        case "Hot":
            return Image("Hot", bundle: Bundle.module)
        case "Isolated Showers":
            return Image("Isolated Showers", bundle: Bundle.module)
        case "Light Snow":
            return Image("Light Snow", bundle: Bundle.module)
        case "Occasional Showers", "Scattered Showers":
            return Image("Occasional Showers_Scattered Showers", bundle: Bundle.module)
        case "Rainy":
            return Image("Rain", bundle: Bundle.module)
        case "Sandstorm", "Duststorm", "Sand", "Dust":
            return Image("Sandsorm_Duststorm_Sand_Dust", bundle: Bundle.module)
        case "Showers", "Heavy Showers", "Rain Showers":
            return Image("Showers_Heavy Showers_Rainshower", bundle: Bundle.module)
        case "Sleet":
            return Image("Sleet", bundle: Bundle.module)
        case "Snow Showers", "Flurries":
            return Image("Snow Showers_Flurries", bundle: Bundle.module)
        case "Snow", "Heavy Snow", "Snowfall":
            return Image("Snow_Heavy Snow_Snowfall", bundle: Bundle.module)
        case "Thunder Rain":
            return Image("Thunder rain", bundle: Bundle.module)
        case "Thunderstorms", "Thundershowers", "Storm", "Lightning":
            return Image("Thunderstorms_Thundershowers_Storm_Lightning", bundle: Bundle.module)
        case "Warm":
            return Image("Warm", bundle: Bundle.module)
        case "Windy", "Squall", "Stormy", "Gale":
            return Image("Windy_Squall_Stormy_Gale", bundle: Bundle.module)
        default:
            return Image("sunny", bundle: Bundle.module)
        }
    }


}

@available(iOS 13.0, *)
#Preview {
    PredictionView(predictions: [
        Forecastday(date: "2024-02-16", day: Day(maxtempC: 25, maxtempF: 77, mintempC: 18, mintempF: 64, maxwindMph: 10, maxwindKph: 16, condition: Condition(text: "Sunny"))),
        Forecastday(date: "2024-02-17", day: Day(maxtempC: 23, maxtempF: 73, mintempC: 17, mintempF: 63, maxwindMph: 12, maxwindKph: 19, condition: Condition(text: "Partly Cloudy"))),
        Forecastday(date: "2024-02-18", day: Day(maxtempC: 22, maxtempF: 72, mintempC: 16, mintempF: 61, maxwindMph: 15, maxwindKph: 24, condition: Condition(text: "Rainy")))
    ])
}



