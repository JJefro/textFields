//
//  CustomTextField.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 25/09/2021.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {

    private var firstRule = UILabel()
    private var secondRule = UILabel()
    private var thirdRule = UILabel()
    private var lastRule = UILabel()
    private var progressLine = UIProgressView()

    private var progressLineHeight = 7
    private var progressLineCornerRadius: CGFloat = 8
    private var validationRulesTextSize: CGFloat = 13
    // When changing the progress, we change the progress line
    private var progress: Float = 0 {
        didSet {
            let rules = [isFirstRuleDone, isSecondRuleDone, isThirdRuleDone, isLastRuleDone]
            let completedRules = rules.filter { $0 == true } .count
            progress = Float(completedRules) * 0.25
            progressLine.progress = progress
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gray.cgColor
    }

    @IBInspectable var hasValidationRules: Bool = false {
        didSet {
            if hasValidationRules {
                makeValidationRulesConstraints()
                makeProgressLineConstraints()
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

    private func updateProgressLineColor() {
        if progressLine.progress <= 0.25 {
            progressLine.progressTintColor = UIColor.red
        } else if progressLine.progress <= 0.75 {
            progressLine.progressTintColor = UIColor.orange
        } else {
            progressLine.progressTintColor = UIColor.green
        }
    }

    private func makeProgressLineConstraints() {
        progressLine.trackTintColor = UIColor.clear
        progressLine.layer.cornerRadius = progressLineCornerRadius

        superview?.addSubview(progressLine)
        progressLine.snp.makeConstraints { make in
            make.height.equalTo(progressLineHeight)
            make.bottom.leading.trailing.equalTo(self)
        }
    }

    // MARK: - Validation Rules Settings
    @IBInspectable var isFirstRuleDone: Bool = false {
        didSet {
            if isFirstRuleDone {
                firstRule.textColor = UIColor.green
                firstRule.text = "✓ Min length 8 characters."
                progress += 1
                updateProgressLineColor()
            } else {
                firstRule.textColor = UIColor.black
                firstRule.text = "- Min length 8 characters."
                progress -= 1
                updateProgressLineColor()
            }
        }
    }

    @IBInspectable var isSecondRuleDone: Bool = false {
        didSet {
            if isSecondRuleDone {
                secondRule.textColor = UIColor.green
                secondRule.text = "✓ Min 1 digit,"
                progress += 1
                updateProgressLineColor()
            } else {
                secondRule.textColor = UIColor.black
                secondRule.text = "- Min 1 digit,"
                progress -= 1
                updateProgressLineColor()
            }
        }
    }

    @IBInspectable var isThirdRuleDone: Bool = false {
        didSet {
            if isThirdRuleDone {
                thirdRule.textColor = UIColor.green
                thirdRule.text = "✓ Min 1 lowercase,"
                progress += 1
                updateProgressLineColor()
            } else {
                thirdRule.textColor = UIColor.black
                thirdRule.text = "- Min 1 lowercase,"
                progress -= 1
                updateProgressLineColor()
            }
        }
    }

    @IBInspectable var isLastRuleDone: Bool = false {
        didSet {
            if isLastRuleDone {
                lastRule.textColor = UIColor.green
                lastRule.text = "✓ Min 1 capital required."
                progress += 1
                updateProgressLineColor()
            } else {
                lastRule.textColor = UIColor.black
                lastRule.text = "- Min 1 capital required."
                progress -= 1
                updateProgressLineColor()
            }
        }
    }

    // MARK: - Validation Rules Constraints
    private func makeValidationRulesConstraints() {
        let labelFont = UIFont(name: "SF Pro Display Regular", size: validationRulesTextSize)
        let leadingConstraints = 24
        let topConstraints = -21

        firstRule.text = "- Min length 8 characters."
        firstRule.font = labelFont
        superview?.addSubview(firstRule)
        firstRule.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        secondRule.text = "- Min 1 digit,"
        secondRule.font = labelFont
        superview?.addSubview(secondRule)
        secondRule.snp.makeConstraints { make in
            make.bottom.equalTo(firstRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        thirdRule.text = "- Min 1 lowercase,"
        thirdRule.font = labelFont
        superview?.addSubview(thirdRule)
        thirdRule.snp.makeConstraints { make in
            make.bottom.equalTo(secondRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }

        lastRule.text = "- Min 1 capital required."
        lastRule.font = labelFont
        superview?.addSubview(lastRule)
        lastRule.snp.makeConstraints { make in
            make.bottom.equalTo(thirdRule).inset(topConstraints)
            make.leading.equalToSuperview().inset(leadingConstraints)
        }
    }
}
