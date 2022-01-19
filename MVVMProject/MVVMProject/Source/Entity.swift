//
//  Entity.swift
//  MVVMProject
//
//  Created by asher.enfj on 2022/01/12.
//

import Foundation
// 서버로부터 온 모델
struct UtcTimeModel : Codable {
    let id: String
    let currentDateTime: String
    let utcOffset: String
    let isDayLightSavingsTime: Bool
    let dayOfTheWeek: String
    let timeZoneName: String
    let currentFileTime: Int
    let ordinalDate: String
    let serviceResponse: String?
    
    // json은 스네이크 케이스로 들어오는데 스위프트는 카멜케이스를 쓴다.따라서 json key이름이 맞지 않을 수 있는데 이럴 경우 CodingKey 프로토콜을 상속받는다. 그러면 case 뒤에 스네이크 케이스를 넣던 다른 문자열을 넣어서 json을 받아올 수 있다
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case currentDateTime
        case utcOffset
        case isDayLightSavingsTime
        case dayOfTheWeek
        case timeZoneName
        case currentFileTime
        case ordinalDate
        case serviceResponse
    }
}
