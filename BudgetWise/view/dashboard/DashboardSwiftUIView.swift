//
//  DashboardSwiftUIView.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 21/01/23.
//

import SwiftUI

struct DashboardSwiftUIView: View {
    var dashCardData: DashCardData
    var dashChartData: DashPieChartData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 50) {
                DashCardView(dashCard: dashCardData)
                    .background(Color("BlueStrong"))
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 1, x: 0, y: 4)
                DashPieChartView(dashChartData: dashChartData)
            }
        })
    }
}

struct DashboardSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardSwiftUIView(dashCardData: DashCardData.sampleData[0], dashChartData: DashPieChartData(values: [1300, 500, 300], colors: [Color.blue, Color.green, Color.orange], backgroundColor: Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0)))
    }
}
