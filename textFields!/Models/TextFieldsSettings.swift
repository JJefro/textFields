//
//  TextFieldsModel.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 22/09/2021.
//

import Foundation
import UIKit

enum TextFieldsSettings {
    case noDigits
    case inputLimit
    case onlyCharacters
    case link
    case validationRules

    var title: String {
        switch self {
        case .noDigits:
            return "NO digits field"
        case .inputLimit:
            return "Input limit"
        case .onlyCharacters:
            return "Only characters"
        case .link:
            return "Link"
        case .validationRules:
            return "Validation rules"
        }
    }
    var placeholder: String {
        switch self {
        case .noDigits:
            return "Type here"
        case .inputLimit:
            return "Type here"
        case .onlyCharacters:
            return "wwwww-ddddd"
        case .link:
            return "www.example.com"
        case .validationRules:
            return "Password"
        }
    }
}

enum TFColors {
    case viewBackground
    case buttonBackground
    case text
    case red
    case green
    case blue
    case orange

    var color: UIColor {
        switch self {
        case .viewBackground:
            return UIColor(named: "BackgroundColor")!
        case .buttonBackground:
            return UIColor(named: "ButtonBackgroundColor")!
        case .text:
            return UIColor(named: "TextColor")!
        case .red:
            return UIColor(named: "Red")!
        case .green:
            return UIColor(named: "Green")!
        case .blue:
            return UIColor(named: "Blue")!
        case .orange:
            return UIColor(named: "Orange")!
        }
    }
}
