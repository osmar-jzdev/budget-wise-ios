//
//  DashPieChartView.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 21/01/23.
//

import SwiftUI

struct DashPieChartView: View {
    var dashChartData : DashPieChartData
   
    var slices: [DashPieSliceData] {
        let sum = dashChartData.values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [DashPieSliceData] = []
       
        for (i, value) in dashChartData.values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(DashPieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.dashChartData.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
   
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0..<self.dashChartData.values.count){ i in
                    DashPieSliceView(pieSliceData: self.slices[i])
                }
                .frame(width: 350, height: 350)
                
                Circle()
                    .fill(self.dashChartData.backgroundColor)
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                
                VStack {
                    Text("Total")
                        .font(.title)
                        .foregroundColor(Color.gray)
                    Text(String(dashChartData.values.reduce(0, +)))
                        .font(.title)
                }
            }
            .background(self.dashChartData.backgroundColor)
            .foregroundColor(Color.white)
        }.frame(width: 350, height: 350, alignment: .center)
    }
}

struct DashPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        DashPieChartView(dashChartData:    DashPieChartData(values: [1300, 500, 300], colors: [Color.blue, Color.green, Color.orange], backgroundColor: Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0)))
    }
}
