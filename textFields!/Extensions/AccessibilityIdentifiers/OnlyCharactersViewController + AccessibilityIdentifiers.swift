//
//  OnlyCharactersViewController + AccessibilityIdentifiers.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import Foundation

extension OnlyCharactersViewController {

    func createAccessibilityIdentifiers() {
        onlyCharactersField.accessibilityIdentifier = "onlyCharactersField_OnlyCharactersView"
        titleLabel.accessibilityIdentifier = "titleLabel_OnlyCharactersView"
        onlyCharactersField.txtFieldTitle.accessibilityIdentifier = "onlyCharactersTxtTitle_OnlyCharactersView"
        onlyCharactersField.txtField.accessibilityIdentifier = "onlyCharactersTxtField_OnlyCharactersView"
    }
}
