//
//  NoDigitsFieldViewUITexts.swift
//  TextFieldsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import XCTest

class NoDigitsFieldViewUITexts: XCTestCase {

    var accessibility = NoDigitsViewUITestAccessibility()

    var app: XCUIApplication!
    var scrollView: XCUIElement!
    var goButton: XCUIElement!
    var tabBar: XCUIElement!
    var tabBarNoDigitsButton: XCUIElement!

    var noDigitsField: XCUIElement!
    var noDigitsTxtField: XCUIElement!
    var titleLabel: XCUIElement!
    var txtFieldTitle: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.scrollView = app.scrollViews[accessibility.scrollView]
        self.goButton = scrollView.buttons[accessibility.goButton]
        self.tabBar = app.tabBars[accessibility.tabBar]
        self.tabBarNoDigitsButton = tabBar.buttons[accessibility.tabBarNoDigitsButton]

        self.noDigitsField = app.otherElements[accessibility.noDigitsField]
        self.noDigitsTxtField = noDigitsField.textFields[accessibility.noDigitsTxtField]
        self.titleLabel = app.staticTexts.element(matching: .any, identifier: accessibility.titleLabel)
        self.txtFieldTitle = noDigitsField.staticTexts.element(matching: .any, identifier: accessibility.txtFieldTitle)
    }

    func testThePresenceOfElements() throws {
        app.swipeUp()
        goButton.tap()
        tabBarNoDigitsButton.tap()

        XCTAssertTrue(noDigitsField.exists)
        XCTAssertTrue(noDigitsTxtField.exists)
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(txtFieldTitle.exists)
    }

    func testNoDigitFieldInteraction() throws {
        let input = "Testing 1no2Digits3Field!"
        let expectedOutput = "Testing noDigitsField!"

        app.swipeUp()
        goButton.tap()
        tabBarNoDigitsButton.tap()

        noDigitsTxtField.tap()
        noDigitsTxtField.typeText(input)
        XCTAssertEqual((noDigitsTxtField.value as? String), expectedOutput)
    }
}
