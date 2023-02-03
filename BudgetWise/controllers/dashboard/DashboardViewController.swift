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
        loadSwiftUIHomeDashboard()
    }
    
    private func loadSwiftUIHomeDashboard() {
        let swiftUICardView: some View = DashboardSwiftUIView(dashCardData: DashCardData.sampleData[0], dashChartData: DashPieChartData(values: [1300, 500, 300], colors: [Color.blue, Color.green, Color.orange], backgroundColor:.white))
        
        let hostingCardControllerCardView = UIHostingController(rootView: swiftUICardView)
        hostingCardControllerCardView.view.translatesAutoresizingMaskIntoConstraints = false
        
    
        self.view.addSubview(hostingCardControllerCardView.view)
        
        NSLayoutConstraint.activate([
            hostingCardControllerCardView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            hostingCardControllerCardView.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            hostingCardControllerCardView.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            hostingCardControllerCardView.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

    }
}
