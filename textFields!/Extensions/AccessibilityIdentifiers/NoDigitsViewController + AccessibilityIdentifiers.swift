//
//  NoDigitsViewController + AccessibilityIdentifiers.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import Foundation

extension NoDigitsViewController {

    func createAccessibilityIdentifiers() {
        noDigitsField.accessibilityIdentifier = "NoDigitsField_NoDigitsView"
        noDigitsField.txtField.accessibilityIdentifier = "NoDigitsTxtField_NoDigitsView"
        titleLabel.accessibilityIdentifier = "titleLabel_NoDigitsView"
        noDigitsField.txtFieldTitle.accessibilityIdentifier = "txtFieldTitle_NoDigitsView"
    }
}
