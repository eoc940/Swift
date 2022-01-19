//
//  BaseVC.swift
//  JeongTutorial
//
//  Created by asher.enfj on 2021/12/27.
//

import UIKit

class BaseVC : UIViewController {
    
    var vcTitle: String = "" {
        // 처음엔 빈 문자열이지만 나중에 값이 들어오면 실행됨
        didSet {
            print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
    
}
