//
//  ViewController.swift
//  Networking
//
//  Created by asher.enfj on 2021/12/23.
//

import UIKit
import Alamofire
import Foundation

// MARK: Welcome
struct Response: Codable {
    let meta: Meta
    let documents: [Document]
}

// MARK: Document
struct Document: Codable {
    let datetime, contents, title: String
    let url: String
}

// MARK: Meta
struct Meta: Codable {
    let totalCount, pageableCount: Int
    let isEnd: Bool
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case pageableCount = "pageable_count"
        case isEnd = "is_end"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var CallButton: UIButton!
    @IBOutlet weak var APITextView: UITextView!
    
    @IBAction func CallButtonClick(_ sender: Any) {
        // 버튼 클릭시 함수 호출
        getPost2()
    }
    var dataSource = [Document]()
    let url = "https://dapi.kakao.com/v2/search/web"
    let headers: HTTPHeaders [
        "Content-Type":"application/x-www-form-urlencoded;charset=utf-8",
        "Authorization":"KakaoAK {263102785b7199efa53647d263b7acff}"]
    let parameters : [String : Any] = [
        "query" : "삼성전자",
        "page" : 1,
        "size" : 15
    ]
    func getPost2() {
        AF.request(url,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                // 여기서 가져온 데이터를 자유롭게 활용하세요
                switch response.result {
                case .success(let res):
                    let resultData = String(data: response.data!, encoding: .utf8)
                    
                    do {
                        // 반환값을 Data 타입으로 변환
                        let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                        let json = try JSONDecoder().decode(Response.self, from: jsonData)
                        self.dataSource = json.documents
                    } catch (let error) {
                        print("catch error : \(error.localizedDescription)")
                    }
                    self.APITextView.text = self.dataSource[2].contents
                case .failure(let error) :
                    print("Request failed with error : \(error)")
                }
            }
    }

}

