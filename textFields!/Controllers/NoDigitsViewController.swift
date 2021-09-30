//
//  NoDigitsViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class NoDigitsViewController: UIViewController {

    @IBOutlet weak var noDigitsField: TextFieldView!
    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsField.fieldSettings = .noDigits
    }
}
