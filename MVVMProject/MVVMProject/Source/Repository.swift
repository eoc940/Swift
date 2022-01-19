//
//  Repository.swift
//  MVVMProject
//
//  Created by asher.enfj on 2022/01/12.
//

import Foundation
// 서버로부터 온 모델을 전달
class Repository {
    func fetchNow(onCompleted: @escaping (UtcTimeModel) -> Void) {
        let url = "http://worldclockapi.com/api/json/utc/now"
        
        //datetimeLabel.text = "Loading..."
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data, let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else {return}
            onCompleted(model)
        }.resume()
        
        // db가 있다면 local db 접속하는 코드가 들어갈것임.
    }
}
