//
//  OnlyCharactersViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class OnlyCharactersViewController: UIViewController {

    @IBOutlet weak var onlyCharactersField: TextFieldView!

    var model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        onlyCharactersField.txtField.delegate = self
        model.fieldSettings = .onlyCharacters
        onlyCharactersField.fieldSettings = .onlyCharacters

        onlyCharactersField.txtField.addTarget(self, action: #selector(TextFieldsViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
}
