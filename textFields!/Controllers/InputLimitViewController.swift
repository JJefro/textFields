//
//  InputLimitViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class InputLimitViewController: UIViewController {

    @IBOutlet weak var inputLimitField: TextFieldView!
    
    var model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        inputLimitField.txtField.delegate = self
        model.fieldSettings = .inputLimit
        inputLimitField.fieldSettings = .inputLimit

        inputLimitField.txtField.addTarget(self, action: #selector(TextFieldsViewController.textFieldDidChange(_:)), for: .editingChanged)
    }

    func updateLimitedInputFieldColor() {
        if model.inputLimit < 0 {
            inputLimitField.txtField.isLimited = true
            inputLimitField.inputLimitLabel.textColor = UIColor.red

        } else {
            inputLimitField.txtField.isLimited = false
            inputLimitField.inputLimitLabel.textColor = UIColor(named: "TextColor")
        }
    }
}
