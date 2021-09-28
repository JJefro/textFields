//
//  OnlyCharactersViewController + UITextFieldDelegate.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

extension OnlyCharactersViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {return}
        if !model.isSeparatorAdded, text.count == model.separatorIndex {
            onlyCharactersField.txtField.text!.append(model.separator)
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {fatalError()}
        let currentText = text + string

        return model.allowedChar(text: currentText, replacementString: string)
    }
}
