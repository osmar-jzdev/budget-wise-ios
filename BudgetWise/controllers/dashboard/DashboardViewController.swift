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
    private let context = (UIApplication.shared.delegate! as! AppDelegate).persistentContainer.viewContext
    private var vm: TransactionViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = TransactionViewModel(context: context)
        vm?.fetch()
        vm?.updateDashboardData()
        loadSwiftUIHomeDashboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm?.updateDashboardData()
    }
    
    private func loadSwiftUIHomeDashboard() {
        //let dashData = DashboardData(txViewModel: vm!)
        let swiftUICardView: some View = DashboardSwiftUIView()
        let hostingCardControllerCardView = UIHostingController(rootView: swiftUICardView.environmentObject(vm!))
        hostingCardControllerCardView.view.translatesAutoresizingMaskIntoConstraints = false
        hostingCardControllerCardView.didMove(toParent: self)
        self.view.addSubview(hostingCardControllerCardView.view)
        
        
        NSLayoutConstraint.activate([
            hostingCardControllerCardView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            hostingCardControllerCardView.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            hostingCardControllerCardView.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            hostingCardControllerCardView.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
