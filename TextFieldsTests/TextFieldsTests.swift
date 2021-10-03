//
//  TextFieldsTests.swift
//  TextFieldsTests
//
//  Created by Jevgenijs Jefrosinins on 03/10/2021.
//

import XCTest
@testable import textFields_

class TextFieldsTests: XCTestCase {

    var sut: TextFieldsViewController!
    var mut: TextFieldModel!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "TextFieldsViewController") as? TextFieldsViewController

        mut = TextFieldModel()

        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        mut = nil
    }

    func testTextFields_WhenLoaded_TextFieldsAreConnected() throws {
        _ = try XCTUnwrap(sut.noDigitsField.txtField, "The noDigitsTextField is not connected")
        _ = try XCTUnwrap(sut.inputLimitField.txtField, "The inputLimitTextField is not connected")
        _ = try XCTUnwrap(sut.onlyCharactersField.txtField, "The onlyCharactersTextField is not connected")
        _ = try XCTUnwrap(sut.linkField.txtField, "The linkTextField is not connected")
        _ = try XCTUnwrap(sut.validationRulesField.txtField, "The validationRulesTextField is not connected")
    }

    // MARK: - NoDigitsField
    func testNoDigitsField_IgnoreDigits() throws {
        let inputWithoutDigits = "asdfg)=!"
        let inputWithDigits = "123ADf3"
        XCTAssertTrue(mut.ignoreDigits(replacementString: inputWithoutDigits))
        XCTAssertFalse(mut.ignoreDigits(replacementString: inputWithDigits))
    }

    // MARK: - OnlyCharactersField
    func testOnlyCharactersField_IsAllowedCharacters() throws {
        let allowedInput = "aSdRv-32145"
        let forbiddenInput = "12dA!-AsdfR"

        XCTAssertTrue(mut.isAllowedChar(text: allowedInput, replacementString: "0"))
        XCTAssertFalse(mut.isAllowedChar(text: forbiddenInput, replacementString: "0"))
    }

    // MARK: - LinkTextField
    func testLinkTextField_WhenCreated_Is_URL_KeyboardType() throws {
        let linkTxtField = try XCTUnwrap(sut.linkField.txtField, "The linkTextField is not connected")

        XCTAssertTrue(linkTxtField.keyboardType == .URL, "LinkTxtField has not URL keyboardType")
    }

    func testLinkTextField_CheckURL_Validation() throws {
        let correctURL = "https://www.google.com"
        let invalidURL = "google"

        XCTAssertEqual(mut.checkUrlValidation(input: invalidURL), "")
        XCTAssertNotNil(mut.checkUrlValidation(input: correctURL))
    }

    // MARK: - ValidationRulesTextField
    func testValidationRulesTextField_WhenCreated_IsSecureTextEntry() throws {
        let validationRulesTxtField = try XCTUnwrap(sut.validationRulesField.txtField, "The validationRulesTextField is not connected")

        XCTAssertTrue(validationRulesTxtField.isSecureTextEntry, "Text in ValidationRulesTxtField is not secure text entry")
    }

    func testValidationRulesTextField_IsMinOfCharactersRule() throws {
        let input1 = "1s3f5g6k8"
        let input2 = "abc"

        XCTAssertFalse(mut.hasRequiredQuantityOfCharacters(charCount: input2.count))
        XCTAssertTrue(mut.hasRequiredQuantityOfCharacters(charCount: input1.count))
    }

    func testValidationRulesTextField_IsContainsDigit_Rule() throws {
        let inputContainingDigit = "1test2"
        let inputWithoutDigits = "test"

        XCTAssertFalse(mut.isContainsDigit(text: inputWithoutDigits))
        XCTAssertTrue(mut.isContainsDigit(text: inputContainingDigit))
    }

    func testValidationRulesTextField_IsContainsLowercaseCharacters_Rule() throws {
        let inputContainingLowercaseChar = "aaa"
        let inputWithoutLowercaseChar = "A"

        XCTAssertFalse(mut.isContainsLowercase(text: inputWithoutLowercaseChar))
        XCTAssertTrue(mut.isContainsLowercase(text: inputContainingLowercaseChar))
    }

    func testValidationRulesTextField_IsContainsUppercaseCharacters_Rule() throws {
        let inputContainingUppercaseChar = "A"
        let inputWithoutUppercaseChar = "aaa"

        XCTAssertFalse(mut.isContainsUppercase(text: inputWithoutUppercaseChar))
        XCTAssertTrue(mut.isContainsUppercase(text: inputContainingUppercaseChar))
    }
}
