//
//  NetworkResult.swift
//  NetworkingPrac
//
//  Created by asher.enfj on 2021/12/23.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

