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
    @IBOutlet var lblErrorMessage: UITextView!
    private var expenseName: String!
    private var expenseValue: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblErrorMessage.isHidden = true
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        if ((lblExpenseName.text?.isEmpty) != nil) && ((lblExpenseValue.text?.isEmpty) != nil) {
            expenseName = lblExpenseName.text
            expenseValue = (lblExpenseValue.text! as NSString).floatValue
        }
        
        if !expenseName.isEmpty && !expenseValue.isZero {
            lblErrorMessage.isHidden = true
            let alertController = UIAlertController(title: "Agregado", message: "Gasto guardado exitosamente", preferredStyle: .alert)
            let action = UIAlertAction(title: "Enterado", style: .default, handler: {_ in
                self.dismiss(animated: true)
            })
            alertController.addAction(action)
            self.present(alertController, animated: true)
            
        } else {
            lblErrorMessage.isHidden = false
        }
    }
    
    @IBAction func btnCloseAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
