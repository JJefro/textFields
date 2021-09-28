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
    func ignoreDigits(replacementString string: String) -> Bool {
        let ignoredCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return string.isEmpty || !characterSet.isSubset(of: ignoredCharacters)
    }

    // MARK: - inputLimitField
    var inputLimit = 10

    func updateLimitInput(length: Int) -> Int {
        inputLimit = 10 - length
        return inputLimit
    }

    func changeTextColor(text: String) -> NSMutableAttributedString {
        let lengthOfRedText = text.utf16.count - 10
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
    private let maxOfCharacters = 11

    func allowedChar(text: String, replacementString string: String) -> Bool {
        var regex = String()
        let format = "SELF MATCHES %@"
        if text.count <= separatorIndex {
            regex = "[a-zA-Z]{1,5}"
            isSeparatorAdded = false
        } else if text.count <= maxOfCharacters {
            regex = "[a-zA-Z]{5}-[0-9]{0,5}"
            isSeparatorAdded = true
        }
        return string.isEmpty || NSPredicate(format: format, regex).evaluate(with: text)
    }

    // MARK: - linkField

    // Checking URL validation using regular expression
//    func isUrlValid(stringURL: String) -> Bool {
//        let regex = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
//        return predicate.evaluate(with: stringURL)
//    }

    func checkUrlValidation(input: String) -> String? {
        var url = String()
        let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let detector = dataDetector {
            let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
            for match in matches {
                guard let range = Range(match.range, in: input) else {continue}
                url = String(input[range])
            }
            return url
        }
        return nil
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
