//
//  DashboardSwiftUIView.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 21/01/23.
//

import SwiftUI

struct DashboardSwiftUIView: View {
    @EnvironmentObject var txViewModel: TransactionViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 50) {
                DashCardView(dashCard: DashCardData(amountMoney: "\(txViewModel.signedBalance)$\(txViewModel.balance)", txtAvailableMoney: "Dinero disponible", txtIncome: "Ingreso", txtExpense: "Gasto", theme: .yellow))
                    .background(Color("BlueStrong"))
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 1, x: 0, y: 4)
                DashPieChartView(dashChartData: DashPieChartData(values: [Double(txViewModel.incomes), Double(txViewModel.expenses)], colors: [Color("GreenCustom"), Color("RedCustom")], backgroundColor:.white))
            }
        })
    }
}
