//
//  TextFieldViewController + UITextFieldDelegate.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 22/09/2021.
//

import UIKit

extension TextFieldsViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        switch model.fieldSettings {
        case .inputLimit:
           if model.inputLimit < 0 {
               inputLimitField.txtField.attributedText = model.changeTextColor(text: textField.text!)
        }
        case .validationRules:
            validationRulesField.txtField.isSecureTextEntry = true

            validationRulesField.txtField.isMinOfCharactersRuleDone =
            model.hasRequiredQuantityOfCharacters(charCount: textField.text!.count)

            validationRulesField.txtField.isMinOfDigitsRuleDone =
            model.isContainsDigit(text: textField.text!)

            validationRulesField.txtField.isMinOfLowercaseCharactersRuleDone =
            model.isContainsLowercase(text: textField.text!)

            validationRulesField.txtField.isMinOfUppercaseCharactersRuleDone =
            model.isContainsUppercase(text: textField.text!)
        default: break
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text else {fatalError()}
        let textLength = text.count + string.count - range.length
        updateFieldSettingsInModel()

        switch model.fieldSettings {
        case .noDigits:
            return model.ignoreDigits(input: string)
        case .inputLimit:
            inputLimitField.inputLimitLabel.text = String(model.updateLimitInput(length: textLength))
            updateLimitedInputCounter()
        case .onlyCharacters:
            if !model.isSeparatorAdded, text.count - range.length == model.separatorIndex {
                onlyCharactersField.txtField.text!.append(model.separator)
            }
            return model.setAllowedCharacters(input: string, length: textLength)
        case .link:
            break
        default: break
        }
        return true
    }
}
