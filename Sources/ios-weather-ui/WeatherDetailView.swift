//
//  WeatherDetailView.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/15/24.
//

import SwiftUI

public struct WeatherDetailView: View {
    @ObservedObject private var viewModel: PredictionAndWeatherDetailViewModel
    
    public init(dailyPrediction: Binding<DailyPrediction?>) {
        self.viewModel = PredictionAndWeatherDetailViewModel(dailyPrediction: dailyPrediction.wrappedValue)
    }
    
    public var body: some View {
        VStack{
            Text("\(viewModel.dailyPrediction?.location.name ?? "") ")
                .font(.headline)
            Text("\(viewModel.convertDecimalToString(viewModel.dailyPrediction?.current.tempC))°C")
                .font(.system(size: 50))
                .bold()
            HStack{
                VStack(alignment: .leading) {
                    WeatherContentView(logo: "arrow.up", name: "Wind Direction", value: "\(viewModel.dailyPrediction?.current.windDir ?? "") ")
                        .padding(.bottom)
                    WeatherContentView(logo: "gauge.with.needle", name: "Pressure(hpa)", value: "\(viewModel.convertDecimalToString(viewModel.dailyPrediction?.current.pressure))")
                }
                Spacer()
                VStack(alignment: .leading){
                    WeatherContentView(logo: "wind", name: "Wind Speed(kmph)", value: "\(viewModel.convertDecimalToString(viewModel.dailyPrediction?.current.windKph))")
                        .padding(.bottom)
                    WeatherContentView(logo: "humidity.fill", name: "Humidity", value: "\(viewModel.convertDecimalToString(viewModel.dailyPrediction?.current.humidity))%")
                }
            }
        }
    }
}
