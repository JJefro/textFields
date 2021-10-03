//
//  LinkViewController + AccessibilityIdentifiers.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import Foundation

extension LinkViewController {

    func createAccessibilityIdentifiers() {
        linkField.accessibilityIdentifier = "linkField_LinkView"
        titleLabel.accessibilityIdentifier = "titleLabel_LinkView"
        linkField.txtFieldTitle.accessibilityIdentifier = "linkFieldTxtTitle_LinkView"
        linkField.txtField.accessibilityIdentifier = "linkTxtField_LinkView"
    }
}
