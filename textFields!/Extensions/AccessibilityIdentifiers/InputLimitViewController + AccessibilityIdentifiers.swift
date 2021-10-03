//
//  InputLimitViewController + AccessibilityIdentifiers.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import Foundation

extension InputLimitViewController {

    func createAccessibilityIdentifiers() {
        inputLimitField.accessibilityIdentifier = "inputLimitField_InputLimitView"
        inputLimitField.txtField.accessibilityIdentifier = "inputLimitTxtField_InputLimitView"
        titleLabel.accessibilityIdentifier = "titleLabel_InputLimitView"
        inputLimitField.txtFieldTitle.accessibilityIdentifier = "inputLimitTxtTitle_InputLimitView"
        inputLimitField.inputLimitScore.accessibilityIdentifier = "inputLimitScore_InputLimitView"
    }
}
