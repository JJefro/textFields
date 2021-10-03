//
//  ValidationRulesViewController + AccessibilityIdentifiers.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import Foundation

extension ValidationRulesViewController {

    func createAccessibilityIdentifiers() {
        titleLabel.accessibilityIdentifier = "titleLabel_ValidationRulesView"
        validationRulesField.accessibilityIdentifier = "validationRulesField_ValidationRulesView"
        validationRulesField.txtFieldTitle.accessibilityIdentifier = "validationRulesTxtTitle_ValidationRulesView"
        validationRulesField.txtField.accessibilityIdentifier = "validationRulesTxtField_ValidationRulesView"

        validationRulesField.txtField.minOfDigitsRule.accessibilityIdentifier = "minOfDigitsRule_ValidationRulesView"
        validationRulesField.txtField.minOfCharactersRule.accessibilityIdentifier = "minOfCharactersRule_ValidationRulesView"
        validationRulesField.txtField.minOfLowercaseCharRule.accessibilityIdentifier = "minOfLowercaseCharRule_ValidationRulesView"
        validationRulesField.txtField.minOfUppercaseCharRule.accessibilityIdentifier = "minOfUppercaseCharRule_ValidationRulesView"
        validationRulesField.txtField.progressView.accessibilityIdentifier = "progressView_ValidationRulesView"
    }
}
