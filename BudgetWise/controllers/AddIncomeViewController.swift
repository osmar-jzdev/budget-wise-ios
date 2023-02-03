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
    @IBOutlet var lblErrorMessage: UITextView!
    private var incomeName: String!
    private var incomeValue: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblErrorMessage.isHidden = true
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        if ((lblIncomeName.text?.isEmpty) != nil) && ((lblIncomeValue.text?.isEmpty) != nil) {
            incomeName = lblIncomeName.text
            incomeValue = (lblIncomeValue.text! as NSString).floatValue
        }
        
        if !incomeName.isEmpty && !incomeValue.isZero {
            lblErrorMessage.isHidden = true
            let alertController = UIAlertController(title: "Agregado", message: "Ingreso guardado exitosamente", preferredStyle: .alert)
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
