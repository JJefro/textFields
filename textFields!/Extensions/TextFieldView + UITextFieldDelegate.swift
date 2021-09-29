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
        let currentText = text + string

        switch fieldSettings {
        case .noDigits:
            return model.ignoreDigits(replacementString: string)
        case .inputLimit:
            inputLimitLabel.text = String(model.updateLimitInput(length: textLength))
            updateLimitedInputFieldColor()
        case .onlyCharacters:
            return model.allowedChar(text: currentText, replacementString: string)
        case .link:
            txtField.autocapitalizationType = .none
            if txtField.text!.isEmpty {
                txtField.text!.append("https://")
            }
        default: break
        }
        return true
    }
}
