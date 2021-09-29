//
//  LinkViewController.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit
import SafariServices

class LinkViewController: UIViewController {

    @IBOutlet weak var linkField: TextFieldView!

    override func viewDidLoad() {
        super.viewDidLoad()

        linkField.fieldSettings = .link
    }
}
