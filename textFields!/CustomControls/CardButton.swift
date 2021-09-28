//
//  CarrButton.swift
//  textFields!
//
//  Created by Jevgenijs Jefrosinins on 28/09/2021.
//

import UIKit

class CardButton: UIButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.init(scaleX: 0.70, y: 0.70)
        }, completion: nil)
        super.touchesBegan(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }, completion: nil)
        super.touchesEnded(touches, with: event)
    }
}
