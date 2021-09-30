//
//  OnlyCharactersViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class OnlyCharactersViewController: UIViewController {

    @IBOutlet weak var onlyCharactersField: TextFieldView!

    override func viewDidLoad() {
        super.viewDidLoad()
        onlyCharactersField.fieldSettings = .onlyCharacters
    }
}
