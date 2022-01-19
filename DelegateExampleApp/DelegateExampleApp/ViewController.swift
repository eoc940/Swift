//
//  ViewController.swift
//  DelegateExampleApp
//
//  Created by asher.enfj on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func tappedShowModel(_ sender: UIButton) {
        let modalViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        
        modalViewController.delegate = self
        
        present(modalViewController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: ModalViewControllerDelegate {
    func modalViewController(_ viewController: ModalViewController, didUpdateText text: String) {
        textLabel.text = text
    }
    
    
}

