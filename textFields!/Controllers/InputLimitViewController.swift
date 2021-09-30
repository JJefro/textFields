//
//  InputLimitViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class InputLimitViewController: UIViewController {

    @IBOutlet weak var inputLimitField: TextFieldView!

    override func viewDidLoad() {
        super.viewDidLoad()
        inputLimitField.fieldSettings = .inputLimit
    }
}
