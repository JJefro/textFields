//
//  ValidationRulesViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class ValidationRulesViewController: UIViewController {

    @IBOutlet weak var validationRulesField: TextFieldView!

    override func viewDidLoad() {
        super.viewDidLoad()
        validationRulesField.fieldSettings = .validationRules
    }
}
