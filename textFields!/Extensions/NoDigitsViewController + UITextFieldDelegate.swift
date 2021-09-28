//
//  NoDigitsViewController + UITextFieldDelegate.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

extension NoDigitsViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return model.ignoreDigits(replacementString: string)
    }
}
