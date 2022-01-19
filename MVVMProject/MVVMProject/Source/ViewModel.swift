//
//  ViewModel.swift
//  MVVMProject
//
//  Created by asher.enfj on 2022/01/12.
//

import Foundation

class ViewModel {
    
    var onUpdated: () -> Void = {}
    
    var dateTimeString: String = "Loading.."
    {
        didSet {
            onUpdated()
        }
    } // 화면에 보여져야할 값. 즉 View를 위한 모델 : ViewModel
    
    let service = Service()
    
    func viewDidLoad() {
        reload()
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: date)
    }
    
    func reload() {
        // Model -> ViewModel 로 변환
        service.fetchNow { [weak self] model in
            
            guard let self = self else {return}
            
            let dateString = self.dateToString(date: model.currentDateTime)
            self.dateTimeString = dateString
        }
    }
    
    func moveDay(day: Int) {
        service.moveDay(day: day)
        self.dateTimeString = dateToString(date: service.currentModel.currentDateTime)
    }
    
}
