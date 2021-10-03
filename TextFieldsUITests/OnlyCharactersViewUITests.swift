//
//  OnlyCharactersViewUITests.swift
//  TextFieldsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import XCTest

class OnlyCharactersViewUITests: XCTestCase {

    var accessibility = OnlyCharactersViewUITestAccessibility()

    var app: XCUIApplication!
    var scrollView: XCUIElement!
    var goButton: XCUIElement!
    var tabBar: XCUIElement!
    var tabBarOnlyCharactersButton: XCUIElement!

    var onlyCharactersField: XCUIElement!
    var onlyCharactersTxtField: XCUIElement!
    var titleLabel: XCUIElement!
    var onlyCharactersTxtTitle: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.scrollView = app.scrollViews[accessibility.scrollView]
        self.goButton = scrollView.buttons[accessibility.goButton]

        self.tabBar = app.tabBars[accessibility.tabBar]
        self.tabBarOnlyCharactersButton = tabBar.buttons[accessibility.tabBarOnlyCharactersButton]
        self.titleLabel = app.staticTexts.element(matching: .any, identifier: accessibility.titleLabel)

        self.onlyCharactersField = app.otherElements[accessibility.onlyCharactersField]
        self.onlyCharactersTxtField = onlyCharactersField.textFields[accessibility.onlyCharactersTxtField]
        self.onlyCharactersTxtTitle = onlyCharactersField.staticTexts.element(matching: .any, identifier: accessibility.onlyCharactersTxtTitle)
    }

    func testThePresenceOfElements() throws {
        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarOnlyCharactersButton.tap()

        XCTAssertTrue(onlyCharactersField.exists)
        onlyCharactersField.tap()
        XCTAssertTrue(onlyCharactersTxtField.exists)
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(onlyCharactersTxtTitle.exists)
    }

    func testOnlyCharactersFieldInteraction() throws {
        let input = "Te123stsdjeafs1j3j5bj3fs4jd5"
        let expectedOutput = "Tests-13534"

        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarOnlyCharactersButton.tap()

        onlyCharactersTxtField.tap()
        onlyCharactersTxtField.typeText(input)
        XCTAssertEqual((onlyCharactersTxtField.value as? String), expectedOutput)
    }
}
