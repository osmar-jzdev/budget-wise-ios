//
//  DashboardCardView.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 16/01/23.
//

import SwiftUI

struct DashboardCardView: View {
    let dashCard: DashboardCard
    var body: some View {
        VStack(alignment: .center) {
                    Text(dashCard.amountMoney)
                .font(.title)
                    Text(dashCard.txtAvailableMoney)
                .font(.subheadline)
                    HStack {
                        VStack(alignment: .center) {
                        Button(action: addNewIncomeAction){
                            HStack {Image(systemName: "clock")
                            }.padding(10.0)
                                .frame(width: 50, height:50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 50.0)
                                .stroke(lineWidth: 1.0))}
                            Text(dashCard.txtIncome)
                                .font(.subheadline)
                        }.padding(5)
                        VStack(alignment: .center) {
                        Button(action: addNewExpenseAction){
                            HStack {Image(systemName: "plus")
                            }.padding(10.0)
                                .frame(width: 50, height:50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 50.0)
                            .stroke(lineWidth: 1.0))}
                            Text(dashCard.txtExpense).font(.subheadline)
                        }.padding(5)
                    }
        }.fixedSize()
            .frame(width: 350, height: 220, alignment: .center)
        
    }
                               
   func addNewIncomeAction() {}
    
   func addNewExpenseAction() {}
}

struct DashboardCardView_Previews: PreviewProvider {
    static var dashCard = DashboardCard.sampleData[0]
    static var previews: some View {
        DashboardCardView(dashCard: dashCard)
            .background(.yellow)
            .previewLayout(.fixed(width: 400, height: 220))
    }
}
