//
//  TextFieldView + UITextFieldDelegate.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 29/09/2021.
//

import UIKit

extension TextFieldView: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
        guard let text = textField.text else {return}
        if fieldSettings == .link {
            if let url = model.checkUrlValidation(input: text) {
                openLink(url)
            }
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text else {fatalError()}
        let textLength = text.count + string.count - range.length
        guard let textRange = Range(range, in: text) else {return false}
        let currentText = text.replacingCharacters(in: textRange, with: string)

        switch fieldSettings {
        case .noDigits:
            return model.ignoreDigits(replacementString: string)
        case .inputLimit:
            inputLimitLabel.text = String(model.updateLimitInput(length: textLength))
            updateLimitedInputFieldColor()
        case .onlyCharacters:
            return model.allowedChar(text: text + string, replacementString: string)
        case .link:
            txtField.autocapitalizationType = .none
            if txtField.text!.isEmpty {
                txtField.text!.append("https://")
            }
        case .validationRules:
            txtField.isSecureTextEntry = true

            txtField.isMinOfCharactersRuleDone =
            model.hasRequiredQuantityOfCharacters(charCount: textLength)

            txtField.isMinOfDigitsRuleDone =
            model.isContainsDigit(text: currentText)

            txtField.isMinOfLowercaseCharactersRuleDone =
            model.isContainsLowercase(text: currentText)

            txtField.isMinOfUppercaseCharactersRuleDone =
            model.isContainsUppercase(text: currentText)
        }
        return true
    }
}
