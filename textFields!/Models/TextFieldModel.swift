//
//  TextFieldModel.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 25/09/2021.
//

import Foundation
import UIKit

class TextFieldModel {

    var fieldSettings: TextFieldsStyle = .noDigits
    var currentText = ""

    // Settings for inputLimitField
    var inputLimit = 10

    func ignoringNoDigitsCharacters(input: String) -> Bool {
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

    func isContainDigit(text: String) -> Bool {
        return text.contains(where: { $0.isNumber })
    }

    func isContainLowercase(text: String) -> Bool {
        return text.contains(where: { $0.isLowercase })
    }
    func isContainUppercase(text: String) -> Bool {
        return text.contains(where: { $0.isUppercase })
    }
}
