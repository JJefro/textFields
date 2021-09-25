//
//  ResuableCustomTextFieldView.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 20/09/2021.
//

import UIKit
import SnapKit

class TextFieldView: UIView {

    @IBOutlet weak var txtField: CustomTextField!
    @IBOutlet weak var txtFieldTitle: UILabel!
    @IBOutlet weak var inputLimitLabel: UILabel!

    let nibName = "TextFieldView"
    var contentView: UIView?
    var model = TextFieldModel()

    var fieldStyle: TextFieldsSettings = .noDigits {
        didSet {
            makeFieldSettings()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func makeFieldSettings() {
        switch fieldStyle {
        case .noDigits:
            txtFieldTitle.text = fieldStyle.title
            txtField.placeholder = fieldStyle.placeholder
            inputLimitLabel.isHidden = true
        case .inputLimit:
            txtFieldTitle.text = fieldStyle.title
            txtField.placeholder = fieldStyle.placeholder
            inputLimitLabel.text = String(model.inputLimit)
        case .onlyCharacters:
            txtFieldTitle.text = fieldStyle.title
            txtField.placeholder = fieldStyle.placeholder
            inputLimitLabel.isHidden = true
        case .link:
            txtFieldTitle.text = fieldStyle.title
            txtField.placeholder = fieldStyle.placeholder
            inputLimitLabel.isHidden = true
        case .validationRules:
            txtFieldTitle.text = fieldStyle.title
            txtField.placeholder = fieldStyle.placeholder
            inputLimitLabel.isHidden = true
            txtField.hasValidationRules = true
        }
    }
}
