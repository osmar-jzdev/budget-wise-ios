//
//  DashPieSliceView.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 21/01/23.
//

import SwiftUI

struct DashPieSliceView: View {
    let pieSliceData: DashPieSliceData
    
    var midRadians: Double {
            return Double.pi / 2.0 - (pieSliceData.startAngle + pieSliceData.endAngle).radians / 2.0
        }
        
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    Path { path in
                        let width: CGFloat = min(geometry.size.width, geometry.size.height)
                        let height = width
                        
                        let center = CGPoint(x: width * 0.5, y: height * 0.5)
                        
                        path.move(to: center)
                        
                        path.addArc(
                            center: center,
                            radius: width * 0.5,
                            startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle,
                            endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle,
                            clockwise: false)
                        
                    }
                    .fill(pieSliceData.color)
                    
                    Text(pieSliceData.text)
                        .position(
                            x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.78 * cos(self.midRadians)),
                            y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.78 * sin(self.midRadians))
                        )
                        .foregroundColor(Color.white)
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }
}

struct DashPieSliceView_Previews: PreviewProvider {
    static var previews: some View {
            DashPieSliceView(pieSliceData: DashPieSliceData(startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 220.0), text: "65%", color: Color.black))
        }
}
