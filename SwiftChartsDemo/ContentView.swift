//  ContentView.swift
//  SwiftChartsDemo
//  Created by Holger Hinzberg on 2023-06-12

import SwiftUI
import Charts

public struct ChartData : Identifiable {
    public let id = UUID()
    public let description: String
    public let value: Double
    public let color: Color
}

struct ContentView: View {
    
    let costs: [ChartData] = [
        ChartData(description: "Rent", value: 124.56, color: .indigo),
        ChartData(description: "Energy", value: 99.99, color: .orange),
        ChartData(description: "Water", value: 12.45, color: .blue),
        ChartData(description: "Emission", value: 63.45, color: .gray),
    ];
    
    var body: some View {
        Chart {
            ForEach(costs) { cost in
                BarMark(
                    x: .value("Description", cost.description),
                    y: .value("Cost", cost.value)
                )
                .cornerRadius(10)
                .foregroundStyle(cost.color)
                .annotation(position: .overlay) {
                    Text("\(cost.value.formatted())")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
