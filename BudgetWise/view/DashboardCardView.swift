//
//  DashboardCardView.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 16/01/23.
//

import SwiftUI

struct DashboardCardView: View {
    let dashCard: DashCardData
    var body: some View {
        VStack(alignment: .center) {
                    Text(dashCard.amountMoney)
                .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(dashCard.txtAvailableMoney)
                        .foregroundColor(Color("GrayCustom"))
                        .font(.title3)
                    HStack {
                        VStack(alignment: .center) {
                            Button(action: addNewIncomeAction){
                                HStack {Image("sym_income")}.padding(10.0)
                                    .frame(width: 55, height:55, alignment: .center)
                                }
                                .accessibilityIdentifier("btn_add_income")
                                .background(RoundedRectangle(cornerRadius: 50.0))
                                .foregroundColor(Color("GreenCustom"))
                                .opacity(0.65)
                            Text(dashCard.txtIncome)
                                .font(.title3)
                                .foregroundColor(Color("GrayCustom"))
                        }.padding(5)
                        VStack(alignment: .center) {
                            Button(action: addNewExpenseAction){
                                HStack {Image("sym_expense")}
                                    .padding(10.0)
                                    .frame(width: 55, height:55, alignment: .center)
                                }
                                .accessibilityIdentifier("btn_add_expense")
                                .background(RoundedRectangle(cornerRadius: 50.0))
                                .foregroundColor(Color("RedCustom"))
                                .opacity(0.65)
                            Text(dashCard.txtExpense).font(.title3)
                                .foregroundColor(Color("GrayCustom"))
                        }.padding(5)
                    }
        }.frame(width: 350, height: 220, alignment: .center)
    }
                               
   func addNewIncomeAction() {}
    
   func addNewExpenseAction() {}
}

struct DashboardCardView_Previews: PreviewProvider {
    static var dashCard = DashCardData.sampleData[0]
    static var previews: some View {
        DashboardCardView(dashCard: dashCard)
            .background(Color("BlueStrong"))
            .previewLayout(.fixed(width: 400, height: 220))
    }
}
