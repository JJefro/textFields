//
//  TextFieldsUITests.swift
//  TextFieldsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import XCTest

class TextFieldsViewUITests: XCTestCase {

    var accessibility = TextFieldsViewControllerAccessibility()

    var app: XCUIApplication!
    var scrollView: XCUIElement!
    var goButton: XCUIElement!

    var noDigitsField: XCUIElement!
    var noDigitsTxtField: XCUIElement!

    var inputLimitField: XCUIElement!
    var inputLimitTxtField: XCUIElement!
    var inputLimitLabel: XCUIElement!

    var onlyCharactersField: XCUIElement!
    var onlyCharactersTxtField: XCUIElement!

    var linkField: XCUIElement!
    var linkTxtField: XCUIElement!

    var validationRulesField: XCUIElement!
    var validationRulesTxtField: XCUIElement!
    var progressView: XCUIElement!
    var minOfCharRuleLabel: XCUIElement!
    var minOfDigitsRuleLabel: XCUIElement!
    var minOfLowerCharRuleLabel: XCUIElement!
    var minOfUpperCharRuleLabel: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.scrollView = app.scrollViews[accessibility.scrollView]
        self.goButton = scrollView.buttons[accessibility.goButton]
        self.progressView = scrollView.progressIndicators[accessibility.progressView]

        self.noDigitsField = scrollView.otherElements[accessibility.noDigitsField]
        self.noDigitsTxtField = noDigitsField.textFields[accessibility.noDigitsTxtField]

        self.inputLimitField = scrollView.otherElements[accessibility.inputLimitField]
        self.inputLimitTxtField = inputLimitField.textFields[accessibility.inputLimitTxtField]
        self.inputLimitLabel = inputLimitField.staticTexts.element(matching: .any, identifier: accessibility.inputLimitLabel)

        self.onlyCharactersField = scrollView.otherElements[accessibility.onlyCharactersField]
        self.onlyCharactersTxtField = onlyCharactersField.textFields[accessibility.onlyCharactersTxtField]

        self.linkField = scrollView.otherElements[accessibility.linkField]
        self.linkTxtField = linkField.textFields[accessibility.linkTxtField]

        self.validationRulesField = scrollView.otherElements[accessibility.validationRulesField]
        self.validationRulesTxtField = validationRulesField.textFields[accessibility.validationRulesTxtField]

        self.minOfDigitsRuleLabel = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfDigitsRule)
        self.minOfCharRuleLabel = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfCharactersRule)
        self.minOfLowerCharRuleLabel = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfLowerCharRule)
        self.minOfUpperCharRuleLabel = validationRulesField.staticTexts.element(matching: .any, identifier: accessibility.minOfUpperCharRule)
    }

    func testThePresenceOfElements() throws {
        XCTAssertTrue(noDigitsField.exists)
        XCTAssertTrue(noDigitsTxtField.exists)

        XCTAssertTrue(inputLimitField.exists)
        XCTAssertTrue(inputLimitTxtField.exists)
        XCTAssertTrue(inputLimitLabel.exists)

        XCTAssertTrue(onlyCharactersField.exists)
        XCTAssertTrue(onlyCharactersTxtField.exists)

        XCTAssertTrue(linkField.exists)
        XCTAssertTrue(linkTxtField.exists)

        XCTAssertTrue(validationRulesField.exists)

        XCTAssertTrue(minOfDigitsRuleLabel.exists)
        XCTAssertTrue(minOfCharRuleLabel.exists)
        XCTAssertTrue(minOfLowerCharRuleLabel.exists)
        XCTAssertTrue(minOfUpperCharRuleLabel.exists)

        XCTAssertTrue(goButton.exists)
        XCTAssertTrue(scrollView.exists)
    }

    func testNoDigitFieldInteraction() throws {
        let input = "Testing 1no2Digits3Field!"
        let expectedOutput = "Testing noDigitsField!"
        noDigitsTxtField.tap()
        noDigitsTxtField.typeText(input)
        XCTAssertEqual((noDigitsTxtField.value as? String), expectedOutput)
    }

    func testInputLimitFieldInteraction() throws {
        inputLimitTxtField.tap()
        inputLimitTxtField.typeText("Check input limit")
        XCTAssertTrue(inputLimitField.staticTexts["-7"].exists)
    }

    func testOnlyCharactersFieldInteraction() throws {
        let input = "Te123stsdjeafs1j3j5bj3fs4jd5"
        let expectedOutput = "Tests-13534"
        onlyCharactersTxtField.tap()
        onlyCharactersTxtField.typeText(input)
        XCTAssertEqual((onlyCharactersTxtField.value as? String), expectedOutput)
    }

    func testLinkFieldInteraction() throws {
        let input = "www.google.com"
        let expectedOutput = "https://www.google.com"
        linkTxtField.tap()
        linkTxtField.typeText(input)
        XCTAssertEqual((linkTxtField.value as? String), expectedOutput)
    }

    func testValidationRulesFieldInteraction() throws {

        validationRulesField.tap()
        // Check labels with validation rules.
        XCTAssertEqual(minOfDigitsRuleLabel.label, "- Min 1 digit,")
        XCTAssertEqual(minOfCharRuleLabel.label, "- Min length 8 characters.")
        XCTAssertEqual(minOfLowerCharRuleLabel.label, "- Min 1 lowercase,")
        XCTAssertEqual(minOfUpperCharRuleLabel.label, "- Min 1 capital required.")

        validationRulesField.typeText("1")
        XCTAssertEqual(minOfDigitsRuleLabel.label, "✓ Min 1 digit,")
        validationRulesField.typeText("a")
        XCTAssertEqual(minOfLowerCharRuleLabel.label, "✓ Min 1 lowercase,")
        validationRulesField.typeText("A")
        XCTAssertEqual(minOfUpperCharRuleLabel.label, "✓ Min 1 capital required.")
        validationRulesField.typeText("abcde")
        XCTAssertEqual(minOfCharRuleLabel.label, "✓ Min length 8 characters.")
    }

    func testProgressViewInValidationRulesField() throws {

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
