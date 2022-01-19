//
//  PersonDataModel.swift
//  NetworkingPrac
//
//  Created by asher.enfj on 2021/12/23.
//

import Foundation

// MARK: PersonDataModel
struct PersonDataModel: Codable {
    let data: Person
    let success: Bool
    let message: String
    let status: Int
}

// MARK: Person
struct Person: Codable {
    let name, profileMessage: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileMessage = "profile_message"
    }
}

//struct
