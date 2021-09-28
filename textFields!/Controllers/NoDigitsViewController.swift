//
//  NoDigitsViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class NoDigitsViewController: UIViewController {

    @IBOutlet weak var noDigitsField: TextFieldView!

    var model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        noDigitsField.txtField.delegate = self
        model.fieldSettings = .noDigits
        noDigitsField.fieldSettings = .noDigits
    }
}
