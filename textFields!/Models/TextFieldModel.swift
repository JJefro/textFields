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

    var inputLimit = 10 /// Limitation of characters count for the input field

    func ignoreDigits(input: String) -> Bool {
        let ignoredCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: input)
        return !characterSet.isSubset(of: ignoredCharacters)
    }

    func checkLimitInput(length: Int) -> Int {
        inputLimit = 10 - length
        return inputLimit
    }

    func isOverlyCharCount(charCount: Int) -> Bool {
        return charCount >= 8
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
