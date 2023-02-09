//
//  DashboardCard.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 16/01/23.
//

import Foundation

struct DashCardData {
    var amountMoney: String
    var txtAvailableMoney: String
    var txtIncome: String
    var txtExpense: String
    var theme: Theme
}

extension DashCardData {
    static let sampleData: [DashCardData] =
    [
        DashCardData(amountMoney: "$10,000.00", txtAvailableMoney: "Dinero disponible", txtIncome: "Ingreso", txtExpense: "Gasto", theme: .yellow)
    ]
}
