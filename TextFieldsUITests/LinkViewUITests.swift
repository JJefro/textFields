//
//  LinkViewUITests.swift
//  TextFieldsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import XCTest

class LinkViewUITests: XCTestCase {

    var accessibility = LinkViewUITestAccessibility()

    var app: XCUIApplication!
    var scrollView: XCUIElement!
    var goButton: XCUIElement!
    var tabBar: XCUIElement!
    var tabBarLinkButton: XCUIElement!

    var linkField: XCUIElement!
    var linkTxtField: XCUIElement!
    var titleLabel: XCUIElement!
    var linkFieldTxtTitle: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()

        self.scrollView = app.scrollViews[accessibility.scrollView]
        self.goButton = scrollView.buttons[accessibility.goButton]

        self.tabBar = app.tabBars[accessibility.tabBar]
        self.tabBarLinkButton = tabBar.buttons[accessibility.tabBarLinkButton]
        self.titleLabel = app.staticTexts.element(matching: .any, identifier: accessibility.titleLabel)

        self.linkField = app.otherElements[accessibility.linkField]
        self.linkTxtField = linkField.textFields[accessibility.linkTxtField]
        self.linkFieldTxtTitle = linkField.staticTexts.element(matching: .any, identifier: accessibility.linkFieldTxtTitle)
    }

    func testThePresenceOfElements() throws {
        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarLinkButton.tap()

        XCTAssertTrue(linkField.exists)
        linkField.tap()
        XCTAssertTrue(linkTxtField.exists)
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(linkFieldTxtTitle.exists)
    }

    func testLinkFieldInteraction() throws {
        let input = "www.google.com"
        let expectedOutput = "https://www.google.com"

        app.swipeUp()
        goButton.tap()
        tabBar.tap()
        tabBarLinkButton.tap()

        linkTxtField.tap()
        linkTxtField.typeText(input)
        XCTAssertEqual((linkTxtField.value as? String), expectedOutput)
    }
}
