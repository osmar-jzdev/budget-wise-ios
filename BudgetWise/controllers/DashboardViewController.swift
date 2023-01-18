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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftUICardView: some View = DashboardCardView(dashCard: DashboardCard.sampleData[0])
            .background(Color("BlueStrong"))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 1, x: 0, y: 4)
        let hostingCardController = UIHostingController(rootView: swiftUICardView)
        hostingCardController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hostingCardController.view)
        
        let cardConstraints = [
            hostingCardController.view.topAnchor.constraint(equalTo: homeNavBarTitle.topAnchor, constant: 80),
            hostingCardController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingCardController.view.centerXAnchor.constraint(equalTo: homeNavBarTitle.centerXAnchor),
            hostingCardController.view.widthAnchor.constraint(equalToConstant: 350 ),
            hostingCardController.view.heightAnchor.constraint(equalToConstant: 220),
        ]
        
        self.view.addConstraints(cardConstraints)
        
    }
}
