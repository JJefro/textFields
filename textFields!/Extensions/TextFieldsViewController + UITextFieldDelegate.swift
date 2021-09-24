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
        case .validationRules:
        validationRulesField.textField.isSecureTextEntry = true
        validationRulesField.textField.isFirstRuleDone = model.isOverlyCharCount(charCount: textField.text!.count)
        validationRulesField.textField.isSecondRuleDone = model.isContainDigit(text: textField.text!)
        validationRulesField.textField.isThirdRuleDone = model.isContainLowercase(text: textField.text!)
        validationRulesField.textField.isLastRuleDone = model.isContainUppercase(text: textField.text!)
        default: break
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text else {fatalError()}
        let textLength = text.count + string.count - range.length

        updateFieldSettingsInModel()

        switch model.fieldSettings {
        case .noDigits:
            return model.ignoringNoDigitsCharacters(input: string)
        case .inputLimit:
            inputLimitField.score.text = String(model.checkLimitInput(length: textLength))
            updateLimitedInputCounter()
        case .onlyCharacters:
            break
        case .link:
            break
        default: break
        }
        return true
    }
}
