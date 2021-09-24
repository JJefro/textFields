//
//  ResuableCustomTextFieldView.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 20/09/2021.
//

import UIKit
import SnapKit

class TextFieldView: UIView {

    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var score: UILabel!

    var firstLabel = UILabel()
    var secondLabel = UILabel()
    var thirdLabel = UILabel()
    var lastLabel = UILabel()

    let nibName = "TextFieldView"
    var contentView: UIView?
    var model = TextFieldModel()

    var fieldStyle: TextFieldsStyle = .noDigits {
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
            leftLabel.text = fieldStyle.title
            textField.placeholder = fieldStyle.placeholder
            score.isHidden = true
        case .inputLimit:
            leftLabel.text = fieldStyle.title
            textField.placeholder = fieldStyle.placeholder
            score.text = String(model.inputLimit)
        case .onlyCharacters:
            leftLabel.text = fieldStyle.title
            textField.placeholder = fieldStyle.placeholder
            score.isHidden = true
        case .link:
            leftLabel.text = fieldStyle.title
            textField.placeholder = fieldStyle.placeholder
            score.isHidden = true
        case .validationRules:
            leftLabel.text = fieldStyle.title
            textField.placeholder = fieldStyle.placeholder
            score.isHidden = true
            textField.hasValidationRules = true
        }
    }
}
