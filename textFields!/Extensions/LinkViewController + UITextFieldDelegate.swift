//
//  LinkViewController + UITextFieldDelegate.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

extension LinkViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
        guard let text = textField.text else {return}
        if let url = model.checkUrlValidation(input: text) {
            openLink(url)
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        linkField.txtField.autocapitalizationType = .none
        if linkField.txtField.text!.isEmpty {
            linkField.txtField.text!.append("https://")
        }
        return true
    }
}
