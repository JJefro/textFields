//
//  ValidationRulesViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class ValidationRulesViewController: UIViewController {

    @IBOutlet weak var validationRulesField: TextFieldView!

    var model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        validationRulesField.txtField.delegate = self
        model.fieldSettings = .validationRules
        validationRulesField.fieldSettings = .validationRules

        validationRulesField.txtField.addTarget(self, action: #selector(TextFieldsViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
}
