//
//  AddExpenseViewController.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 24/01/23.
//

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet var lblExpenseName: UITextField!
    @IBOutlet var lblExpenseValue: UITextField!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var btnClose: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func expenseNameInput(_ sender: UITextField) {
    }
    
    @IBAction func expenseValueInput(_ sender: UITextField) {
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
    }
    
    @IBAction func btnCloseAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
