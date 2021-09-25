//
//  CustomTextField.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 25/09/2021.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {

    private var minOfCharactersRule = UILabel()
    private var minOfDigitsRule = UILabel()
    private var minOfLowercaseCharactersRule = UILabel()
    private var minOfUppercaseCharactersRule = UILabel()

    private var progressView = UIProgressView()

    private var progressLineHeight = 7
    private var progressLineCornerRadius: CGFloat = 15
    private var validationRulesTextSize: CGFloat = 13
    private var stepInPercentageTerms: Float = 0.25 /// Execution of one rule as a percentage

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gray.cgColor
    }

    /// When progress has changed, we change progress line length and progressTintColor with animation
    private var progress: Float = 0 {
        didSet {
            let rules = [isMinOfCharactersRuleDone, isMinOfDigitsRuleDone, isMinOfLowercaseCharactersRuleDone, isMinOfUppercaseCharactersRuleDone]
            let completedRules = rules.filter { $0 == true } .count
            progress = Float(completedRules) * stepInPercentageTerms

            UIView.animate(withDuration: 0.9) {
                self.progressView.setProgress(self.progress, animated: true)
                self.updateProgressViewTintColor()
            }
        }
    }

    @IBInspectable var hasValidationRules: Bool = false {
        didSet {
            if hasValidationRules {
                makeValidationLabelsConstraints()
                makeProgressViewConstraints()
            }
        }
    }

    @IBInspectable var isLimited: Bool = false {
        didSet {
            self.textColor = isLimited ? UIColor.red : UIColor.black
            self.layer.borderColor = isLimited ? UIColor.red.cgColor : UIColor.blue.cgColor
        }
    }

    override var isSelected: Bool {
        didSet {
            self.layer.borderColor = !isSelected ? UIColor.gray.cgColor : UIColor.blue.cgColor
        }
    }

    private func updateProgressViewTintColor() {
        if progressView.progress <= 0.25 {
            progressView.progressTintColor = UIColor.red
        } else if progressView.progress <= 0.75 {
            progressView.progressTintColor = UIColor.orange
        } else {
            progressView.progressTintColor = UIColor.green
        }
    }

    private func makeProgressViewConstraints() {
        progressView.trackTintColor = UIColor.clear
        progressView.layer.cornerRadius = progressLineCornerRadius

        superview?.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.height.equalTo(progressLineHeight)
            make.bottom.leading.trailing.equalTo(self)
        }
    }

    // MARK: - Validation Rules Settings
    @IBInspectable var isMinOfCharactersRuleDone: Bool = false {
        didSet {
            if isMinOfCharactersRuleDone {
                minOfCharactersRule.textColor = UIColor.green
                minOfCharactersRule.text = "✓ Min length 8 characters."
                progress += 1
            } else {
                minOfCharactersRule.textColor = UIColor.black
                minOfCharactersRule.text = "- Min length 8 characters."
                progress -= 1
            }
        }
    }

    @IBInspectable var isMinOfDigitsRuleDone: Bool = false {
        didSet {
            if isMinOfDigitsRuleDone {
                minOfDigitsRule.textColor = UIColor.green
                minOfDigitsRule.text = "✓ Min 1 digit,"
                progress += 1
            } else {
                minOfDigitsRule.textColor = UIColor.black
                minOfDigitsRule.text = "- Min 1 digit,"
                progress -= 1
            }
        }
    }

    @IBInspectable var isMinOfLowercaseCharactersRuleDone: Bool = false {
        didSet {
            if isMinOfLowercaseCharactersRuleDone {
                minOfLowercaseCharactersRule.textColor = UIColor.green
                minOfLowercaseCharactersRule.text = "✓ Min 1 lowercase,"
                progress += 1
            } else {
                minOfLowercaseCharactersRule.textColor = UIColor.black
                minOfLowercaseCharactersRule.text = "- Min 1 lowercase,"
                progress -= 1
            }
        }
    }

    @IBInspectable var isMinOfUppercaseCharactersRuleDone: Bool = false {
        didSet {
            if isMinOfUppercaseCharactersRuleDone {
                minOfUppercaseCharactersRule.textColor = UIColor.green
                minOfUppercaseCharactersRule.text = "✓ Min 1 capital required."
                progress += 1
            } else {
                minOfUppercaseCharactersRule.textColor = UIColor.black
                minOfUppercaseCharactersRule.text = "- Min 1 capital required."
                progress -= 1
            }
        }
    }

    // MARK: - Validation Labels Constraints
    private func makeValidationLabelsConstraints() {
        let labelFont = UIFont(name: "SF Pro Display Regular", size: validationRulesTextSize)
        let leadingConstraints = 24
        let topConstraints = -21

        minOfCharactersRule.text = "- Min length 8 characters."
        minOfCharactersRule.font = labelFont
        superview?.addSubview(minOfCharactersRule)
        minOfCharactersRule.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        minOfDigitsRule.text = "- Min 1 digit,"
        minOfDigitsRule.font = labelFont
        superview?.addSubview(minOfDigitsRule)
        minOfDigitsRule.snp.makeConstraints { make in
            make.bottom.equalTo(minOfCharactersRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        minOfLowercaseCharactersRule.text = "- Min 1 lowercase,"
        minOfLowercaseCharactersRule.font = labelFont
        superview?.addSubview(minOfLowercaseCharactersRule)
        minOfLowercaseCharactersRule.snp.makeConstraints { make in
            make.bottom.equalTo(minOfDigitsRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        minOfUppercaseCharactersRule.text = "- Min 1 capital required."
        minOfUppercaseCharactersRule.font = labelFont
        superview?.addSubview(minOfUppercaseCharactersRule)
        minOfUppercaseCharactersRule.snp.makeConstraints { make in
            make.bottom.equalTo(minOfLowercaseCharactersRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }
    }
}
