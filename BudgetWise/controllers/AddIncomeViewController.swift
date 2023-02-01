//
//  AddIncomeViewController.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 24/01/23.
//

import UIKit

class AddIncomeViewController: UIViewController {
    @IBOutlet var lblIncomeName: UITextField!
    @IBOutlet var lblIncomeValue: UITextField!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var btnClose: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
    }
    @IBAction func btnCloseAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
