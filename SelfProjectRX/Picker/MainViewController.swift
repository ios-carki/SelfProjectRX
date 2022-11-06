//
//  MainViewController.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/03.
//

import UIKit

import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        pickerSetting()
    }
    
    func pickerSetting() {
        
        Observable.combineLatest(mainView.testTextField1.rx.text.orEmpty, mainView.testTextField2.rx.text.orEmpty) { value1, value2 in
            return "name은 \(value1)이고, 이메일은 \(value2) 입니다."
        }
        .bind(to: mainView.testLabel.rx.text)
        .disposed(by: disposeBag)
        
        mainView.testTextField1.rx.text.orEmpty
            .map { $0.count < 4 }
            .bind(to: mainView.testTextField2.rx.isHidden, mainView.testButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        mainView.testTextField2.rx.text.orEmpty
            .map { $0.count > 4}
            .bind(to: mainView.testButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        mainView.testButton.rx.tap
            .subscribe { _ in
                self.showAlert()
            }
            .disposed(by: disposeBag)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "얼럿", message: "버튼관련", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
    
    
//    func rxSetting() {
//        Observable.just([1, 2, 3])
//            .bind(to: mainView.pickerView1.rx.itemTitles) { _, item in
//                return "\(item)"
//            }
//            .disposed(by: disposeBag)
//
//        mainView.pickerView1.rx.modelSelected(Int.self)
//            .subscribe (onNext: { models in
//                print("모델 선택 1: \(models)")
//            })
//            .disposed(by: disposeBag)
//
//        //
//
//        Observable.just([1, 2, 3])
//            .bind(to: mainView.pickerView2.rx.itemAttributedTitles) { _, item in
//                return NSAttributedString(string: "\(item)",
//                                          attributes: [
//                                            NSAttributedString.Key.foregroundColor: UIColor.cyan,
//                                            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.double.rawValue
//                                          ])
//            }
//            .disposed(by: disposeBag)
//
//        mainView.pickerView2.rx.modelSelected(Int.self)
//            .subscribe(onNext: { models in
//                print("모델선택 2: \(models)")
//            })
//            .disposed(by: disposeBag)
//
//        //
//
//        Observable.just([UIColor.red, UIColor.green, UIColor.blue])
//            .bind(to: mainView.pickerView3.rx.items) { _, item, _ in
//                let view = UIView()
//                view.backgroundColor = item
//                return view
//            }
//            .disposed(by: disposeBag)
//
//        mainView.pickerView3.rx.modelSelected(UIColor.self)
//            .subscribe(onNext: { models in
//                print("모델3: \(models)")
//            })
//            .disposed(by: disposeBag)
//
//    }
    
}
