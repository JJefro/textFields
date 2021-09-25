//
//  TextFieldModel.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 25/09/2021.
//

import Foundation
import UIKit

class TextFieldModel {

    var fieldSettings: TextFieldsSettings = .noDigits

    // MARK: - noDigitsField
    func ignoreDigits(input: String) -> Bool {
        let ignoredCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: input)
        return input.isEmpty || !characterSet.isSubset(of: ignoredCharacters)
    }

    // MARK: - inputLimitField
    var inputLimit = 10
    func updateLimitInput(length: Int) -> Int {
        inputLimit = 10 - length
        return inputLimit
    }

    func changeTextColor(text: String) -> NSMutableAttributedString {
        let lengthOfRedText = text.count - 10
        let range = NSRange(location: 10, length: lengthOfRedText)
        let string = NSAttributedString(string: text)
        let attributedString = NSMutableAttributedString(attributedString: string)
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
        return attributedString
    }

    // MARK: - onlyCharactersField
    let separator = "-"
    let separatorIndex = 5
    var isSeparatorAdded = false
    func setAllowedCharacters(input: String, length: Int) -> Bool {
        if length <= 5 {
            isSeparatorAdded = false
            let allowedCharacters = CharacterSet.letters
            let typedCharacterSet = CharacterSet(charactersIn: input)
            return allowedCharacters.isSuperset(of: typedCharacterSet)
        } else if length <= 11 {
            isSeparatorAdded = true
            let allowedCharacters = CharacterSet.decimalDigits
            let typedCharacterSet = CharacterSet(charactersIn: input)
            return input.isEmpty || allowedCharacters.isSuperset(of: typedCharacterSet)
        }
        return false
    }

    // MARK: - validationRulesField

    private let requiredQuantity = 8
    func hasRequiredQuantityOfCharacters(charCount: Int) -> Bool {
        return charCount >= requiredQuantity
    }

    func isContainsDigit(text: String) -> Bool {
        return text.contains(where: { $0.isNumber })
    }

    func isContainsLowercase(text: String) -> Bool {
        return text.contains(where: { $0.isLowercase })
    }

    func isContainsUppercase(text: String) -> Bool {
        return text.contains(where: { $0.isUppercase })
    }
}
