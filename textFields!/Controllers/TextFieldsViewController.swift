//
//  ViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 18/09/2021.
//

import UIKit

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noDigitsField: TextFieldView!
    @IBOutlet weak var inputLimitField: TextFieldView!
    @IBOutlet weak var onlyCharactersField: TextFieldView!
    @IBOutlet weak var linkField: TextFieldView!
    @IBOutlet weak var validationRulesField: TextFieldView!
    
    var model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        noDigitsField.textField.delegate = self
        inputLimitField.textField.delegate = self
        onlyCharactersField.textField.delegate = self
        linkField.textField.delegate = self
        validationRulesField.textField.delegate = self

        noDigitsField.fieldStyle = .noDigits
        inputLimitField.fieldStyle = .inputLimit
        onlyCharactersField.fieldStyle = .onlyCharacters
        linkField.fieldStyle = .link
        validationRulesField.fieldStyle = .validationRules

        validationRulesField.textField.addTarget(self, action: #selector(TextFieldsViewController.textFieldDidChange(_:)), for: .editingChanged)
    }

    func updateFieldSettingsInModel() {
        if noDigitsField.textField.isSelected {
            model.fieldSettings = .noDigits
        } else if inputLimitField.textField.isSelected {
            model.fieldSettings = .inputLimit
        } else if onlyCharactersField.textField.isSelected {
            model.fieldSettings = .onlyCharacters
        } else if linkField.textField.isSelected {
            model.fieldSettings = .link
        } else if validationRulesField.textField.isSelected {
            model.fieldSettings = .validationRules
        }
    }
    func updateLimitedInputCounter() {
        if model.inputLimit < 0 {
            inputLimitField.textField.isLimited = true
            inputLimitField.score.textColor = UIColor.red
        } else {
            inputLimitField.textField.isLimited = false
            inputLimitField.score.textColor = UIColor.black
        }
    }
}
