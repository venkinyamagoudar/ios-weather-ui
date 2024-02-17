//
//  SwiftUIView.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/16/24.
//

import SwiftUI

public struct WeatherContentView: View {
    var logo: String
    var name: String
    var value: String
    
    public var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title3)
            }
        }
    }
}

#Preview {
    WeatherContentView(logo: "wind", name: "Wind Speed", value: "12kmp")
}
