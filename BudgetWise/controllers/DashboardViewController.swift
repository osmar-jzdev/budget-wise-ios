//
//  DashboardViewController.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 14/01/23.
//

import UIKit
import SwiftUI

class DashboardViewController: UIViewController {

    @IBOutlet var homeNavBarTitle: UINavigationBar!
    @IBOutlet var homeNavBarBottom: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCardView()
        loadPieChart()
    }
    
    private func loadCardView() {
        let swiftUICardView: some View = DashboardCardView(dashCard: DashCardData.sampleData[0])
            .background(Color("BlueStrong"))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 1, x: 0, y: 4)
        let hostingCardControllerCardView = UIHostingController(rootView: swiftUICardView)
        hostingCardControllerCardView.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hostingCardControllerCardView.view)
        
        let cardConstraints = [
            hostingCardControllerCardView.view.topAnchor.constraint(equalTo: homeNavBarTitle.topAnchor, constant: 80),
            hostingCardControllerCardView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingCardControllerCardView.view.centerXAnchor.constraint(equalTo: homeNavBarTitle.centerXAnchor),
            hostingCardControllerCardView.view.widthAnchor.constraint(equalToConstant: 350 ),
            hostingCardControllerCardView.view.heightAnchor.constraint(equalToConstant: 220),
        ]
        self.view.addConstraints(cardConstraints)
    }
    
    private func loadPieChart() {
        let swiftUICardView: some View = DashPieChartView(values: [1300, 500, 300], colors: [Color.blue, Color.green, Color.orange], backgroundColor: Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0))
        let hostingCardController = UIHostingController(rootView: swiftUICardView)
        hostingCardController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hostingCardController.view)
        
        let cardConstraints = [
            hostingCardController.view.topAnchor.constraint(equalTo: view.topAnchor, constant:385),
            hostingCardController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingCardController.view.centerXAnchor.constraint(equalTo: homeNavBarTitle.centerXAnchor),
            hostingCardController.view.widthAnchor.constraint(equalToConstant: 350 ),
            hostingCardController.view.heightAnchor.constraint(equalToConstant: 230),
        ]
        
        self.view.addConstraints(cardConstraints)
    }
}
