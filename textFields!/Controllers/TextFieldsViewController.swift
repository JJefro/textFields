//
//  ViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 18/09/2021.
//

import UIKit
import SafariServices

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noDigitsField: TextFieldView!
    @IBOutlet weak var inputLimitField: TextFieldView!
    @IBOutlet weak var onlyCharactersField: TextFieldView!
    @IBOutlet weak var linkField: TextFieldView!
    @IBOutlet weak var validationRulesField: TextFieldView!

    var model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        noDigitsField.txtField.delegate = self
        inputLimitField.txtField.delegate = self
        onlyCharactersField.txtField.delegate = self
        linkField.txtField.delegate = self
        validationRulesField.txtField.delegate = self

        noDigitsField.fieldSettings = .noDigits
        inputLimitField.fieldSettings = .inputLimit
        onlyCharactersField.fieldSettings = .onlyCharacters
        linkField.fieldSettings = .link
        validationRulesField.fieldSettings = .validationRules

        inputLimitField.txtField.addTarget(self, action: #selector(TextFieldsViewController.textFieldDidChange(_:)), for: .editingChanged)
        onlyCharactersField.txtField.addTarget(self, action: #selector(TextFieldsViewController.textFieldDidChange(_:)), for: .editingChanged)
        validationRulesField.txtField.addTarget(self, action: #selector(TextFieldsViewController.textFieldDidChange(_:)), for: .editingChanged)
    }

    func updateFieldSettingsInModel() {
        if noDigitsField.txtField.isSelected {
            model.fieldSettings = .noDigits
        } else if inputLimitField.txtField.isSelected {
            model.fieldSettings = .inputLimit
        } else if onlyCharactersField.txtField.isSelected {
            model.fieldSettings = .onlyCharacters
        } else if linkField.txtField.isSelected {
            model.fieldSettings = .link
        } else if validationRulesField.txtField.isSelected {
            model.fieldSettings = .validationRules
        }
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

    func openLink(_ stringURL: String) {
        guard let url = URL(string: stringURL) else {return}
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}
