//
//  InputLimitFieldViewUITests.swift
//  TextFieldsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import XCTest

class InputLimitFieldViewUITests: XCTestCase {

    var accessibility = InputLimitViewUITestAccessibility()

    var app: XCUIApplication!
    var scrollView: XCUIElement!
    var goButton: XCUIElement!
    var tabBar: XCUIElement!
    var tabBarInputLimitButton: XCUIElement!

    var inputLimitField: XCUIElement!
    var inputLimitTxtField: XCUIElement!
    var titleLabel: XCUIElement!
    var inputLimitTxtTitle: XCUIElement!
    var inputLimitScore: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.scrollView = app.scrollViews[accessibility.scrollView]
        self.goButton = scrollView.buttons[accessibility.goButton]

        self.tabBar = app.tabBars[accessibility.tabBar]
        self.tabBarInputLimitButton = tabBar.buttons[accessibility.tabBarInputLimitButton]
        self.titleLabel = app.staticTexts.element(matching: .any, identifier: accessibility.titleLabel)

        self.inputLimitField = app.otherElements[accessibility.inputLimitField]
        self.inputLimitTxtField = inputLimitField.textFields[accessibility.inputLimitTxtField]
        self.inputLimitTxtTitle = inputLimitField.staticTexts.element(matching: .any, identifier: accessibility.inputLimitTxtTitle)
        self.inputLimitScore = inputLimitField.staticTexts.element(matching: .any, identifier: accessibility.inputLimitScore)
    }

    func testThePresenceOfElements() throws {
        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarInputLimitButton.tap()

        XCTAssertTrue(inputLimitField.exists)
        inputLimitField.tap()
        XCTAssertTrue(inputLimitTxtField.exists)
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(inputLimitTxtTitle.exists)
        XCTAssertTrue(inputLimitScore.exists)
    }

    func testInputLimitFieldInteraction() throws {
        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarInputLimitButton.tap()

        inputLimitField.tap()
        inputLimitField.typeText("Check input limit")
        XCTAssertTrue(inputLimitField.staticTexts["-7"].exists)
    }
}
