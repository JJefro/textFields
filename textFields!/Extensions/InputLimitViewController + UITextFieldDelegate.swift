//
//  InputLimitViewController + UITextFieldDelegate.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

extension InputLimitViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {return}
        if model.inputLimit < 0 {
            inputLimitField.txtField.attributedText = model.changeTextColor(text: text)
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {fatalError()}
        let textLength = text.count + string.count - range.length

        inputLimitField.inputLimitLabel.text = String(model.updateLimitInput(length: textLength))
        updateLimitedInputFieldColor()
        return true
    }
}
