//
//  WeatherDetailView.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/15/24.
//

import SwiftUI

public struct WeatherDetailView: View {
    @Binding private var dailyPrediction: DailyPrediction?
    
    public init(dailyPrediction: Binding<DailyPrediction?>) {
        self._dailyPrediction = dailyPrediction
    }
    
    public var body: some View {
        VStack {
            Text("\(dailyPrediction?.location.name ?? "") ")
                .font(.system(size: 20))
            
            if let temperature = dailyPrediction?.current.tempC {
                let formattedTemperature = String(format: "%.2f", temperature)
                Text("\(formattedTemperature)°C")
                    .font(.system(size: 55))
                    .bold()
                    .padding(.top,20)
            }
            
            HStack{
                VStack(alignment: .center) {
                    Text("\(dailyPrediction?.current.windDir ?? "") ")
                        .padding()
                    Text("\(dailyPrediction?.current.condition.text ?? "") ")
                }
                .padding(.leading,40)
                Spacer()
                VStack(alignment: .center){
                    Text("\(dailyPrediction?.current.windKph ?? 0) km/h")
                        .padding()
                    Text("\(dailyPrediction?.current.humidity ?? 0)%")
                }
                .padding(20)
            }
        }
    }
}

//#Preview {
//    WeatherDetailView(location: .init(initialValue: "New York"),
//                windDirection: .init(initialValue: "NW"),
//                condition: .init(initialValue: "Cloudy"),
//                wind: .init(initialValue: "15 mph"),
//                humidity: .init(initialValue: "80%"),
//                temperature: .init(initialValue: "65°F"))
//}





//        self._location = location
//        self._windDirection = windDirection
//        self._condition = condition
//        self._wind = wind
//        self._humidity = humidity
//        self._temperature = temperature

//    @Binding private var location: String
//    @Binding private var windDirection: String
//    @Binding private var condition: String
//    @Binding private var wind: String
//    @Binding private var humidity: String
//    @Binding private var temperature: String

/* location: Binding<String>, windDirection: Binding<String>, condition: Binding<String>, wind: Binding<String>, humidity: Binding<String>, temperature: Binding<String>*/
