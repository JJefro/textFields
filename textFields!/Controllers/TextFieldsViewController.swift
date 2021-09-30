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

    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsField.fieldSettings = .noDigits
        inputLimitField.fieldSettings = .inputLimit
        onlyCharactersField.fieldSettings = .onlyCharacters
        linkField.fieldSettings = .link
        validationRulesField.fieldSettings = .validationRules
    }
}
