//
//  GetNetworkMessageService.swift
//  JSONPrac
//
//  Created by asher.enfj on 2021/12/24.
//

import Foundation
import Alamofire

struct GetNetworkMessageService{
    
    static let shared = GetNetworkMessageService()

    
    func getInfo(_ name: String, _ message: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        //let URL = "http://10.202.41.179:8080/echo?name=dfd&message=dfda"
        let URL = "http://10.202.41.179:8080/echo?name=" + name + "&message=" + message
        let header : HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData {dataResponse in
            switch dataResponse.result {
            case .success:
                // dataResponse.statusCode는 Response의 statusCode - 200 / 400 / 500
                guard let statusCode = dataResponse.response?.statusCode else {return}
                print(statusCode)
                
                // dataResponse.value는 Response의 결과 데이터
                guard let value = dataResponse.value else {return}
                print("value : \(value)")
                // judgeStatus라는 함수에 statusCode와 response(결과데이터)를 실어서 보낸다
                let networkResult = self.judgeStatus(by: statusCode, value)
                print("networkResult : \(networkResult)")
                completion(networkResult)
                
            /*
             통신 실패의 경우, completion에 pathErr 값을 담아서 뷰컨으로 날려준다
             타임아웃 / 통신 불가능의 상태로 통신 자체에 실패한 경우이다
             */
            case .failure(let error): completion(.pathErr)
                print(error)
                print("dataResponse : \(dataResponse)" )
                
            }
        }
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400: return .pathErr // -> 요청이 잘못됨
        case 500: return .serverErr // -> 서버 에러
        default: return .networkFail // -> 네트워크 에러로 분기 처리할 예정
        }
    }
    private func isValidData(data: Data) -> NetworkResult<Any> {
        // JSON 데이터를 해독하기 위해 JSONDecoder()를 하나 선언
        let decoder = JSONDecoder()
//
        /*
         data를 우리가 만들어둔 PersonDataModel 형으로 decode 해준다
         실패하면 pathErr로 빼고, 성공하면 decodedData에 값을 뺀다
         */
        // MARK: 여기서 걸림
        guard let decodedData = try? decoder.decode(Message.self, from: data) else {
            //print(data)
            return .pathErr }
        
        print("decodedData : \(decodedData)")
        // 성공적으로 decode를 마치면 success에다가 data 부분을 담아서 completion을 호출한다
        return .success(decodedData)
    }
    
}


