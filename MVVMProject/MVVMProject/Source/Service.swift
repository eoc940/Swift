//
//  Logic.swift
//  MVVMProject
//
//  Created by asher.enfj on 2022/01/12.
//

import Foundation
// 레파지토리를 이용하여 로직에서 사용하는 struct Model로 바꿔주었다
// 뷰모델이 아니라 서비스에서 핵심 비지니스 로직이 이루어진다
class Service {
    
    let repository = Repository()
    
    var currentModel = Model(currentDateTime: Date())
    
    func fetchNow(onCompleted: @escaping (Model) -> Void) {
        // Entity -> Model 로 변환
        repository.fetchNow { entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: entity.currentDateTime) else {return}
            
            let model = Model(currentDateTime: now)
            self.currentModel = model
            onCompleted(model)
        }
    }
    
    func moveDay(day: Int) {
        guard let movedDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else {
            return
        }
        currentModel.currentDateTime = movedDay
        
    }
    // service는 로컬에 있는 데이터와 api로 받은 데이터를 체이닝
    // vm으로 보내고, 로컬에 대한 데이터 업데이트를 해라
}
