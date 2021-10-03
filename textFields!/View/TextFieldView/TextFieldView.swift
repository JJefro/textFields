//
//  ResuableCustomTextFieldView.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 20/09/2021.
//

import UIKit
import SnapKit
import SafariServices

class TextFieldView: UIView {

    @IBOutlet weak var txtFieldTitle: UILabel!
    @IBOutlet weak var inputLimitScore: UILabel!
    @IBOutlet weak var txtField: CustomTextField!

    let nibName = "TextFieldView"
    var contentView: UIView?
    var model = TextFieldModel()

    var fieldSettings: TextFieldsSettings = .noDigits {
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

        commonInit()
    }

    private func commonInit() {
        txtField.delegate = self
        txtField.returnKeyType = .done
        txtField.addTarget(self, action: #selector(TextFieldView.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func makeFieldSettings() {
        switch fieldSettings {
        case .noDigits:
            txtFieldTitle.text = fieldSettings.title
            txtField.placeholder = fieldSettings.placeholder
            inputLimitScore.isHidden = true
        case .inputLimit:
            txtFieldTitle.text = fieldSettings.title
            txtField.placeholder = fieldSettings.placeholder
            inputLimitScore.text = String(model.inputLimit)
        case .onlyCharacters:
            txtFieldTitle.text = fieldSettings.title
            txtField.placeholder = fieldSettings.placeholder
            inputLimitScore.isHidden = true
        case .link:
            txtFieldTitle.text = fieldSettings.title
            txtField.placeholder = fieldSettings.placeholder
            txtField.keyboardType = .URL
            inputLimitScore.isHidden = true
        case .validationRules:
            txtFieldTitle.text = fieldSettings.title
            txtField.placeholder = fieldSettings.placeholder
            inputLimitScore.isHidden = true
            txtField.isSecureTextEntry = true
            txtField.hasValidationRules = true
        }
    }

    func updateLimitedInputFieldColor() {
        if model.inputLimit < 0 {
            txtField.isLimited = true
            inputLimitScore.textColor = TFColors.red.color
        } else {
            txtField.isLimited = false
            inputLimitScore.textColor = TFColors.text.color
            txtField.textColor = TFColors.text.color
        }
    }

    func openLink(_ stringURL: String) {
        guard let url = URL(string: stringURL) else {return}
        let safariVC = SFSafariViewController(url: url)
        let keywindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        if var viewController = keywindow?.rootViewController {
            while let presentedViewController = viewController.presentedViewController {
                viewController = presentedViewController
            }
            viewController.present(safariVC, animated: true, completion: nil)
        }
    }
}
