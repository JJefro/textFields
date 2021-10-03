//
//  TextFieldsViewController + AccessibilityIdentifiers.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import Foundation

extension TextFieldsViewController {

    func createAccesibilityIdentifiers() {
        noDigitsField.accessibilityIdentifier = "NoDigitsField_TextFieldsView"
        noDigitsField.txtField.accessibilityIdentifier = "NoDigitsTxtField_TextFieldsView"

        inputLimitField.accessibilityIdentifier = "InputLimitField_TextFieldsView"
        inputLimitField.txtField.accessibilityIdentifier = "InputLimitTxtField_TextFieldsView"
        inputLimitField.inputLimitScore.accessibilityIdentifier = "InputLimitLabel_TextFieldsView"

        onlyCharactersField.accessibilityIdentifier = "OnlyCharactersField_TextFieldsView"
        onlyCharactersField.txtField.accessibilityIdentifier = "OnlyCharactersTxtField_TextFieldsView"

        linkField.accessibilityIdentifier = "LinkField_TextFieldsView"
        linkField.txtField.accessibilityIdentifier = "LinkTxtField_TextFieldsView"

        validationRulesField.accessibilityIdentifier = "ValidationRulesField_TextFieldsView"
        validationRulesField.txtField.accessibilityIdentifier = "ValidationRulesTxtField_TextFieldsView"
        validationRulesField.txtField.minOfDigitsRule.accessibilityIdentifier = "MinOfDigitsRule_TextFieldsView"
        validationRulesField.txtField.minOfCharactersRule.accessibilityIdentifier = "MinOfCharactersRule_TextFieldsView"
        validationRulesField.txtField.minOfLowercaseCharRule.accessibilityIdentifier = "MinOfLowerCharRule_TextFieldsView"
        validationRulesField.txtField.minOfUppercaseCharRule.accessibilityIdentifier = "MinOfUpperCharRule_TextFieldsView"
        validationRulesField.txtField.progressView.accessibilityIdentifier = "ProgressView_TextFieldsView"

        goButton.accessibilityIdentifier = "GoButton_TextFieldsView"
        scrollView.accessibilityIdentifier = "ScrollView_TextFieldsView"
    }
}
