//
//  ValidationRulesViewController + UITextFieldDelegate.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

extension ValidationRulesViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {return}

        validationRulesField.txtField.isSecureTextEntry = true

        validationRulesField.txtField.isMinOfCharactersRuleDone =
        model.hasRequiredQuantityOfCharacters(charCount: text.count)

        validationRulesField.txtField.isMinOfDigitsRuleDone =
        model.isContainsDigit(text: text)

        validationRulesField.txtField.isMinOfLowercaseCharactersRuleDone =
        model.isContainsLowercase(text: text)

        validationRulesField.txtField.isMinOfUppercaseCharactersRuleDone =
        model.isContainsUppercase(text: text)
    }
}
