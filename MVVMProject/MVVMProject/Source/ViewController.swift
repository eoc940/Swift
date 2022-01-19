//
//  ViewController.swift
//  MVVMProject
//
//  Created by asher.enfj on 2022/01/12.
//

/*
 정리!
 View Viewmodel을 이용하여 화면을 그림
 Viewmodel은 Service 사용하여 Model을 가져옴
 Service는 Repository를 사용하여 Entity를 가져옴

 여기서 모델이라고 할만한 것들은 세 가지가 사용되었다.
 Entity는 원천데이터이고
 Model은 서비스에서 사용하는 근본데이터
 ViewModel은 근본데이터가 화면에 보여지는 화면데이터
 
 viewmodel이 view에게 데이터가 바뀌었음을 콜백해주는것은 onUpdated로 해주었다.
 view는 콜백을 받고 다시 그림을 그린다
 */

import UIKit

// ViewModel만 바라보며 ViewModel의 값만 바뀌었을 때 업데이트만함
class ViewController: UIViewController {
    
    // MARK: - VIEW
    @IBOutlet var datetimeLabel: UILabel!
    
    @IBAction func onYesterday() {
        viewModel.moveDay(day: -1)
    }
    @IBAction func onNow() {
        datetimeLabel.text = "Loading..."
        viewModel.reload()
    }
    @IBAction func onTomorrow() {
        viewModel.moveDay(day: 1)
    }
    let viewModel = ViewModel()
    
    // MARK: - Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 콜백 받아서 UI 변경됨
        viewModel.onUpdated = { [weak self] in
            // UIKit을 사용하는 여기서 dispatchqueue를 달아주는 게 낫다
            DispatchQueue.main.async {
                self?.datetimeLabel.text = self?.viewModel.dateTimeString
            }
        }
        viewModel.reload()
    }
}

/*
 https://bongcando.tistory.com/20
 weak self(약한 참조)는 retain cycle(순환 참조)로 인한 메모리 릭을 벗어나기 위해 사용. Swift가 Automatic Reference Counting(ARC)를 사용하며 대부분의 참조 문제를 해결했지만, 두 가지 이상의 객체가 서로에 대한 강한 참조 상태를 가지고 있다면 Retain Cycle이 발생하게 되며 이때 메모리 릭이 발생한다. 이런 메모리 릭 이슈를 해결하기 위해 weak reference를 사용
 
 weak reference의 특징
 1. 인스턴스를 strong하게 유지하지 않는다. 따라서 weak reference가 인스턴스에 대한 참조를 유지 중이어도 deallocate 될 수 있다.
 2. weak reference는 레퍼런스 카운트를 증가시키지 않는다
 3. weak reference는 optional이며, runtime에도 value를 nil로 만들 수 있다
 
 따라서 self를 캡쳐링 하는 상황에서 self에 대한 순환참조가 발생하지 않기 위해 weak self를 사용한다
 
 weak self를 언제 사용하는가?
 - 이스케이핑 클로저 안에서 지연할당의 가능성이 있는 경우(API 비동기 데이터 처리, 타이머 등). 이스케이프 클로저가 아닌 일반 클로저에서는 scope 안에서 즉시 실행되므로 Strong Reference Cycle을 유발하지 않으므로, weak self를 사용할 필요가 없다.
 - 클로저가 객체에 대한 지연 deallocation 가능성이 있는 경우
 
 
 */
