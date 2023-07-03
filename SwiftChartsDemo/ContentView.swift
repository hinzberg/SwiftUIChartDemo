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
                RuleMark( y: .value("Max", 90))
                    .foregroundStyle(Color.red)
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5,8]))
                    .annotation(alignment: .trailing) {
                        Text("Max  ")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                    
                ForEach(costs) { cost in
                    BarMark(
                        x: .value("Description", cost.description),
                        y: .value("Cost", cost.value)
                    )
                    .cornerRadius(10)
                    .foregroundStyle(cost.color.gradient)
                    .annotation(position: .overlay) {
                        Text("\(cost.value.formatted()) €")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
        
            .chartXAxis {
                AxisMarks() { value in
                    // Gridlines
                    AxisGridLine(centered: false, stroke: StrokeStyle(dash: [1, 10]))
                        .foregroundStyle(.blue.gradient)
                    // Tick Marks
                    AxisTick(centered: false, stroke: StrokeStyle(dash: [1, 2]))
                        .foregroundStyle(.red)
                    // Value Labels
                    AxisValueLabel() {
                        if let description = value.as(String.self) {
                            Text("\(description)")
                                .foregroundStyle(.purple)
                                .font(.title)
                        }
                    }
                }
            }
        
         //   .chartYScale(domain: 0...250)
        /*
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
        */
        /*
            // Plot Area
            .chartPlotStyle{ plotContent in
                plotContent
                    .background(.blue.gradient.opacity(0.1))
                    .border(.black, width: 1)
            }
         */
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
