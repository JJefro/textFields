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

    var model = TextFieldModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        model.fieldSettings = .link
        linkField.fieldSettings = .link
        linkField.txtField.delegate = self
    }

    func openLink(_ stringURL: String) {
        guard let url = URL(string: stringURL) else {return}
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}
