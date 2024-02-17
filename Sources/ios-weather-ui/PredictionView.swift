//
//  PredictionView.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/15/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct PredictionView: View {
    
    @ObservedObject private var viewModel: PredictionAndWeatherDetailViewModel
    
    public init(dailyPrediction: Binding<DailyPrediction?>) {
        self.viewModel = PredictionAndWeatherDetailViewModel(dailyPrediction: dailyPrediction.wrappedValue)
    }
    
    public var body: some View {
        List(viewModel.predictions, id: \.date) { prediction in
            HStack{
                if let dayOfWeek = viewModel.dayOfWeek(for: prediction.date) {
                    Text(dayOfWeek)
                        .frame(width: 50)
                }
                let conditionImage = viewModel.getImage(for: prediction.day.condition.text)
                conditionImage
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.blue)
                Spacer()
                Text(viewModel.convertDecimalToString(prediction.day.maxtempC))
                Spacer()
                Text(viewModel.convertDecimalToString(prediction.day.mintempC))
            }
        }
        .listRowInsets(EdgeInsets())
        Spacer()
    }
}
