//
//  NumberViewController.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/03.
//

import UIKit

import RxSwift
import RxCocoa

class NumberViewController: UIViewController {
    
    let mainView = NumberView()
    
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        Observable.combineLatest(mainView.textField1.rx.text.orEmpty, mainView.textField2.rx.text.orEmpty, mainView.textField3.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
                return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
        }
        .map { $0.description }
        .bind(to: mainView.label.rx.text)
        .disposed(by: disposeBag)
    }
}
