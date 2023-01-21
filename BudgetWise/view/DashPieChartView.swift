//
//  DashPieChartView.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 21/01/23.
//

import SwiftUI

struct DashPieChartView: View {
    public let values: [Double]
    public var colors: [Color]
   
    public var backgroundColor: Color
   
    var slices: [DashPieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [DashPieSliceData] = []
       
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(DashPieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
   
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0..<self.values.count){ i in
                    DashPieSliceView(pieSliceData: self.slices[i])
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                
                Circle()
                    .fill(self.backgroundColor)
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                
                VStack {
                    Text("Total")
                        .font(.title)
                        .foregroundColor(Color.gray)
                    Text(String(values.reduce(0, +)))
                        .font(.title)
                }
            }
            .background(self.backgroundColor)
            .foregroundColor(Color.white)
        }
    }
}

struct DashPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        DashPieChartView(values: [1300, 500, 300], colors: [Color.blue, Color.green, Color.orange], backgroundColor: Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0))
    }
}
