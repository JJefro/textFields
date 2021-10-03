//
//  UITestsAccessibilityIdentifiers.swift
//  TextFieldsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import Foundation

// MARK: - TextFieldsViewControllerAccessibilityIdentifiers
struct TextFieldsViewControllerAccessibility {

    let noDigitsField = "NoDigitsField_TextFieldsView"
    let noDigitsTxtField = "NoDigitsTxtField_TextFieldsView"

    let inputLimitField = "InputLimitField_TextFieldsView"
    let inputLimitTxtField = "InputLimitTxtField_TextFieldsView"
    let inputLimitLabel = "InputLimitLabel_TextFieldsView"

    let onlyCharactersField = "OnlyCharactersField_TextFieldsView"
    let onlyCharactersTxtField = "OnlyCharactersTxtField_TextFieldsView"

    let linkField = "LinkField_TextFieldsView"
    let linkTxtField = "LinkTxtField_TextFieldsView"

    let validationRulesField = "ValidationRulesField_TextFieldsView"
    let validationRulesTxtField = "ValidationRulesTxtField_TextFieldsView"
    let minOfDigitsRule = "MinOfDigitsRule_TextFieldsView"
    let minOfCharactersRule = "MinOfCharactersRule_TextFieldsView"
    let minOfLowerCharRule = "MinOfLowerCharRule_TextFieldsView"
    let minOfUpperCharRule = "MinOfUpperCharRule_TextFieldsView"

    let goButton = "GoButton_TextFieldsView"
    let scrollView = "ScrollView_TextFieldsView"
    let progressView = "ProgressView_TextFieldsView"

}

// MARK: - NoDigitsViewControllerAccessibilityIdentifiers
struct NoDigitsViewUITestAccessibility {

    let scrollView = "ScrollView_TextFieldsView"
    let goButton = "GoButton_TextFieldsView"
    let tabBar = "Tab Bar"
    let tabBarNoDigitsButton = "NoDigits"

    let noDigitsField = "NoDigitsField_NoDigitsView"
    let noDigitsTxtField = "NoDigitsTxtField_NoDigitsView"
    let titleLabel = "titleLabel_NoDigitsView"
    let txtFieldTitle = "txtFieldTitle_NoDigitsView"
}

// MARK: - InputLimitViewControllerAccessibilityIdentifiers
struct InputLimitViewUITestAccessibility {

    let scrollView = "ScrollView_TextFieldsView"
    let goButton = "GoButton_TextFieldsView"
    let tabBar = "Tab Bar"
    let tabBarInputLimitButton = "InputLimit"

    let inputLimitField = "inputLimitField_InputLimitView"
    let inputLimitTxtField = "inputLimitTxtField_InputLimitView"
    let titleLabel = "titleLabel_InputLimitView"
    let inputLimitTxtTitle = "inputLimitTxtTitle_InputLimitView"
    let inputLimitScore = "inputLimitScore_InputLimitView"
}

// MARK: - OnlyCharactersViewControllerAccessibilityIdentifiers
struct OnlyCharactersViewUITestAccessibility {

    let scrollView = "ScrollView_TextFieldsView"
    let goButton = "GoButton_TextFieldsView"
    let tabBar = "Tab Bar"
    let tabBarOnlyCharactersButton = "OnlyCharacters"

    let onlyCharactersField = "onlyCharactersField_OnlyCharactersView"
    let titleLabel = "titleLabel_OnlyCharactersView"
    let onlyCharactersTxtTitle = "onlyCharactersTxtTitle_OnlyCharactersView"
    let onlyCharactersTxtField = "onlyCharactersTxtField_OnlyCharactersView"
}

// MARK: - LinkViewControllerAccessibilityIdentifiers
struct LinkViewUITestAccessibility {

    let scrollView = "ScrollView_TextFieldsView"
    let goButton = "GoButton_TextFieldsView"
    let tabBar = "Tab Bar"
    let tabBarLinkButton = "Link"

    let linkField = "linkField_LinkView"
    let titleLabel = "titleLabel_LinkView"
    let linkFieldTxtTitle = "linkFieldTxtTitle_LinkView"
    let linkTxtField = "linkTxtField_LinkView"
}

// MARK: - ValidationRulesViewControllerAccessibilityIdentifiers
struct ValidationRulesViewUITestAccessibility {

    let scrollView = "ScrollView_TextFieldsView"
    let goButton = "GoButton_TextFieldsView"
    let tabBar = "Tab Bar"
    let tabBarValidationButton = "Validation"

    let titleLabel = "titleLabel_ValidationRulesView"
    let validationRulesField = "validationRulesField_ValidationRulesView"
    let validationRulesTxtTitle = "validationRulesTxtTitle_ValidationRulesView"
    let validationRulesTxtField = "validationRulesTxtField_ValidationRulesView"

    let minOfDigitsRule = "minOfDigitsRule_ValidationRulesView"
    let minOfCharactersRule = "minOfCharactersRule_ValidationRulesView"
    let minOfLowercaseCharRule = "minOfLowercaseCharRule_ValidationRulesView"
    let minOfUppercaseCharRule = "minOfUppercaseCharRule_ValidationRulesView"
    let progressView = "progressView_ValidationRulesView"
}
