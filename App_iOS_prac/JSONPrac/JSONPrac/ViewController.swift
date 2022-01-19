//
//  ViewController.swift
//  JSONPrac
//
//  Created by asher.enfj on 2021/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Tname: UITextField!
    @IBOutlet weak var Ttext: UITextField!
    @IBOutlet weak var Lname: UILabel!
    @IBOutlet weak var Ltext: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getButtonClicked(_ sender: Any) {
        
        GetNetworkMessageService.shared.getInfo(Tname.text ?? "", Ttext.text ?? "") {(response) in
            
            switch(response) {
            case .success(let message) :
                // personData를 Person형이라고 옵셔널 바인딩 해주고, 정상적으로 값을 data에 담아둔다
                print("response : \(response)" )
                print("message : \(message)" )
                if let data = message as? Message {
                    self.Lname.text = data.name
                    self.Ltext.text = data.message
                }
            
            case .requestErr(let message) :
                print("requestErr", message)
            case .pathErr:
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
        
        
        
    }


}

