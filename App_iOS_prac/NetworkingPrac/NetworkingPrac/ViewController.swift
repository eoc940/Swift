//
//  ViewController.swift
//  NetworkingPrac
//
//  Created by asher.enfj on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 버튼을 누르면 통신을 진행하는 코드
    @IBAction func getButtonClicked(_ sender: Any) {
        /*
         GetPersonDataService 구조체에서 shared라는 공용 인스턴스에 접근한다 -> 싱글턴 패턴
         그리고 만들어둔 getPersonInfo 메서드를 사용한다
         */
        GetPersonDataService.shared.getPersonInfo { (response) in
            // NetworkResult형 enum값을 이용해서 분기처리를 한다
            switch(response) {
                /*
                 성공할 경우에는 <T>형으로 데이터를 받아올 수 있다고 했기 때문에 Generic하게 아무 타입이나 가능하기 때문에 클로저에서 넘어오는 데이터를 let personData라고 정의한다
                 */
            case .success(let personData) :
                // personData를 Person형이라고 옵셔널 바인딩 해주고, 정상적으로 값을 data에 담아둔다
                print("response : \(response)" )
                print("personData : \(personData)" )
                if let data = personData as? Person {
                    self.nameLabel.text = data.name
                    self.messageLabel.text = data.profileMessage
                }
            
            case .requestErr(let message) :
                print("requestErr", message)
            case .pathErr:
                print("pathErr")
                print(response)
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }


}

