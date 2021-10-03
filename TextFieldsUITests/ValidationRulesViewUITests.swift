//
//  ValidationRulesViewUITests.swift
//  TextFieldsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import XCTest

class ValidationRulesViewUITests: XCTestCase {

    var accessibility = ValidationRulesViewUITestAccessibility()

    var app: XCUIApplication!
    var scrollView: XCUIElement!
    var goButton: XCUIElement!
    var tabBar: XCUIElement!
    var tabBarValidationButton: XCUIElement!

    var titleLabel: XCUIElement!
    var validationRulesField: XCUIElement!
    var validationRulesTxtTitle: XCUIElement!
    var validationRulesTxtField: XCUIElement!

    var minOfDigitsRule: XCUIElement!
    var minOfCharactersRule: XCUIElement!
    var minOfLowercaseCharRule: XCUIElement!
    var minOfUppercaseCharRule: XCUIElement!
    var progressView: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = true
        self.app = XCUIApplication()
        self.app.launch()

        self.scrollView = app.scrollViews[accessibility.scrollView]
        self.goButton = scrollView.buttons[accessibility.goButton]

        self.tabBar = app.tabBars[accessibility.tabBar]
        self.tabBarValidationButton = tabBar.buttons[accessibility.tabBarValidationButton]
        self.titleLabel = app.staticTexts.element(matching: .any, identifier: accessibility.titleLabel)

        self.validationRulesField = app.otherElements[accessibility.validationRulesField]
        self.validationRulesTxtField = validationRulesField.textFields[accessibility.validationRulesTxtField]
        self.validationRulesTxtTitle = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.validationRulesTxtTitle)

        self.progressView = app.progressIndicators[accessibility.progressView]

        self.minOfDigitsRule = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfDigitsRule)
        self.minOfCharactersRule = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfCharactersRule)
        self.minOfLowercaseCharRule = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfLowercaseCharRule)
        self.minOfUppercaseCharRule = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfUppercaseCharRule)
    }

    func testThePresenceOfElements() throws {
        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarValidationButton.tap()

        XCTAssertTrue(validationRulesField.exists)
        validationRulesField.tap()
        XCTAssertTrue(validationRulesTxtTitle.exists)
        XCTAssertTrue(titleLabel.exists)

        validationRulesField.tap()
        validationRulesField.typeText("test")
        XCTAssertTrue(minOfDigitsRule.exists)
        XCTAssertTrue(minOfCharactersRule.exists)
        XCTAssertTrue(minOfLowercaseCharRule.exists)
        XCTAssertTrue(minOfUppercaseCharRule.exists)

        XCTAssertTrue(progressView.exists)
    }

    func testValidationRulesFieldInteraction() throws {
        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarValidationButton.tap()

        validationRulesField.tap()
        // Check labels with validation rules.
        XCTAssertEqual(minOfDigitsRule.label, "- Min 1 digit,")
        XCTAssertEqual(minOfCharactersRule.label, "- Min length 8 characters.")
        XCTAssertEqual(minOfLowercaseCharRule.label, "- Min 1 lowercase,")
        XCTAssertEqual(minOfUppercaseCharRule.label, "- Min 1 capital required.")

        validationRulesField.tap()
        validationRulesField.typeText("1")
        XCTAssertEqual(minOfDigitsRule.label, "✓ Min 1 digit,")
        validationRulesField.typeText("a")
        XCTAssertEqual(minOfLowercaseCharRule.label, "✓ Min 1 lowercase,")
        validationRulesField.typeText("A")
        XCTAssertEqual(minOfUppercaseCharRule.label, "✓ Min 1 capital required.")
        validationRulesField.typeText("abcde")
        XCTAssertEqual(minOfCharactersRule.label, "✓ Min length 8 characters.")
    }

    func testProgressViewInValidationRulesField() throws {
        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarValidationButton.tap()

        validationRulesField.tap()
        validationRulesField.typeText("1")
        XCTAssertEqual((progressView.value as? String), "25%")
        validationRulesField.typeText("a")
        XCTAssertEqual((progressView.value as? String), "50%")
        validationRulesField.typeText("A")
        XCTAssertEqual((progressView.value as? String), "75%")
        validationRulesField.typeText("abcde")
        XCTAssertEqual((progressView.value as? String), "100%")
    }
}
