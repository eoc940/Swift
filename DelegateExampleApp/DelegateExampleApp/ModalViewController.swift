//
//  ModelViewController.swift
//  DelegateExampleApp
//
//  Created by asher.enfj on 2022/01/19.
//

import UIKit

protocol ModalViewControllerDelegate: AnyObject {
    func modalViewController(_ viewController: ModalViewController, didUpdateText text: String)
}

class ModalViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    weak var delegate: ModalViewControllerDelegate?
    
    @IBAction func tappedDoneButton(_ sender: UIButton) {
        guard let text = textField.text else { return }
        delegate?.modalViewController(self, didUpdateText: text)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
