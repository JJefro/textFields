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
        updateFieldSettingsInModel()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
        guard let text = textField.text else {return}
        if model.fieldSettings == .link {
            if let url = model.checkUrlValidation(input: text) {
                openLink(url)
            }
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch model.fieldSettings {
        case .inputLimit:
            if model.inputLimit < 0 {
                inputLimitField.txtField.attributedText = model.changeTextColor(text: text)
            }
        case .onlyCharacters:
            if !model.isSeparatorAdded, text.count == model.separatorIndex {
                onlyCharactersField.txtField.text!.append(model.separator)
            }
        case .validationRules:
            validationRulesField.txtField.isSecureTextEntry = true

            validationRulesField.txtField.isMinOfCharactersRuleDone =
            model.hasRequiredQuantityOfCharacters(charCount: text.count)

            validationRulesField.txtField.isMinOfDigitsRuleDone =
            model.isContainsDigit(text: text)

            validationRulesField.txtField.isMinOfLowercaseCharactersRuleDone =
            model.isContainsLowercase(text: text)

            validationRulesField.txtField.isMinOfUppercaseCharactersRuleDone =
            model.isContainsUppercase(text: text)
        default: break
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text else {fatalError()}
        let textLength = text.count + string.count - range.length
        let currentText = text + string

        switch model.fieldSettings {
        case .noDigits:
            return model.ignoreDigits(replacementString: string)
        case .inputLimit:
            inputLimitField.inputLimitLabel.text = String(model.updateLimitInput(length: textLength))
            updateLimitedInputFieldColor()
        case .onlyCharacters:
            return model.allowedChar(text: currentText, replacementString: string)
        case .link:
            linkField.txtField.autocapitalizationType = .none
            if linkField.txtField.text!.isEmpty {
                linkField.txtField.text!.append("https://")
            }
        default: break
        }
        return true
    }
}
