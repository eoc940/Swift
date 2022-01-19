//
//  ViewController.swift
//  JeongTutorial
//
//  Created by asher.enfj on 2021/12/25.
//

import UIKit
import Toast_Swift

// search bar를 감지하겠다. 따라서 상속해줌
class HomeVC: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    var keyboardDismissTabGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)
    
    // MARK: fileprivate methods
    fileprivate func pushVC() {
        var segueId : String = ""
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            print("사진 화면으로 이동")
            segueId = "goToPhotoCollectionVC"
        case 1:
            print("사용자 화면으로 이동")
            segueId = "goToUserListVC"
        default:
            print("default ")
            segueId = "goToPhotoCollectionVC"
        }
    
        // 화면 이동
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    fileprivate func config() {
        // ui 설정
        // 검색 버튼의 테두리를 조금 둥그렇게 해줌
        self.searchButton.layer.cornerRadius = 10
        // 검색 바 위아래로 줄이 있는데 그걸 없애줌
        self.searchBar.searchBarStyle = .minimal
        
        // delegate 감지
        self.searchBar.delegate = self
        
        self.keyboardDismissTabGesture.delegate = self
        
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
        
        
    }
    
    @objc func keyboardWillShowHandle(notification: NSNotification) {
        print("HomeVC - keyboardWillShow() called")
        // 키보드 사이즈 가져오기
        if let keyboardSize =
            (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("keyboardSize.hei : \(keyboardSize.height)")
            
            if keyboardSize.height < searchButton.frame.origin.y {
                print("키보드가 버튼을 덮었다")
                let distance = keyboardSize.height - searchButton.frame.origin.y
                print("이만큼 덮었다. distance : \(distance)")
                self.view.frame.origin.y = distance + searchButton.frame.height
            }
        }
        
        //self.view.frame.origin.y = -100
    }
    
    @objc func keyboardWillHideHandle() {
        print("HomeVC - keyboardWillHide() called")
        self.view.frame.origin.y = 0
    }
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()

        print("HomeVC - viewDidLoad() called")
        
        self.config()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear() called")
        self.searchBar.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillAppear() called")
        // 키보드 올라가는 이벤트를 받는 처리
        // 키보드 노티 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandle), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear() called ")
        // 키보드 노티 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 화면이 넘어가기 전에 준비한다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeVC - prepare() called / segue.identifier : \(segue.identifier)")
    
        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VC:
            // 다음 화면의 뷰컨트롤러를 가져온다
            let nextVC = segue.destination as! UserListVC
            guard let userInputValue = self.searchBar.text else {return}
            
            nextVC.vcTitle = userInputValue + "😃"
        default:
            print("default")
        }
    }
    
    // MARK: IBAction methods
    @IBAction func onSearchButtonClicked(_ sender: Any) {
        print("HomeVC - onSearchButtonClicked() called \(searchFilterSegment.selectedSegmentIndex)")
        
        // 화면으로 이동
        pushVC()
        
    }
    
    
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        print("HomeVC - searchFilterValueChanged() called  / index : \(sender.selectedSegmentIndex)")
        
        var searchBarTitle = ""
        // 세그먼트 클릭시 placeholder 값 바꿔줌
        switch sender.selectedSegmentIndex {
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력"
        print("prior working")
        self.searchBar.becomeFirstResponder()// 포커싱 주기(키보드 올라옴)
//        self.searchBar.resignFirstResponder()// 포커싱 해제
        print("after working")
    }
    
    // MARK: UISearchBar Delegate methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchBarSearchButtonClicked()")
    
        guard let userInputString = searchBar.text else { return }
        
        if userInputString.isEmpty {
            self.view.makeToast("📢 검색 키워드를 입력해주세요", duration: 1.0, position: .center)
        } else {
            pushVC()
            searchBar.resignFirstResponder()
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText : \(searchText)")
        
        // 사용자가 입력한 값이 없을때
        if searchText.isEmpty {
            self.searchButton.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                searchBar.resignFirstResponder()
            })
            
            // 포커싱 해제
            searchBar.resignFirstResponder()
        } else {
            self.searchButton.isHidden = false
        }
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        print("shouldChangeTextIn : \(inputTextCount)")
        
        if inputTextCount >= 12 {
            self.view.makeToast("📢 12자까지만 입력 가능합니다", duration: 1.0, position: .center)
        }
        
        if inputTextCount <= 12 {
            return true
        } else {
            // return false하면 글자입력이 더 안됨
            return false
        }
        

    }

    // MARK:- UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("HomeVC - gestureRecognizer shouldReceive() called")
        
        // 터치로 들어온 뷰가 요놈이면
        if touch.view?.isDescendant(of: searchFilterSegment) == true {
            print("세그먼트가 터치되었다")
            return false
        } else if touch.view?.isDescendant(of: searchBar) == true {
            print("서치바가 터치되었다")
            return false
        
        }else {
            view.endEditing(true)
            return true
        }
        
        
        
    }

}

