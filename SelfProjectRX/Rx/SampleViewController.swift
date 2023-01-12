//
//  SampleViewController.swift
//  SelfProjectRX
//
//  Created by Carki on 2023/01/11.
//

import UIKit

import RxSwift
import RxCocoa
import Toast

//input = sampleTextField

//output = sampleLabel, Button 유효성검사

final class SampleViewController: UIViewController {
    private let mainView = SampleView()
    private let disposeBag = DisposeBag()
    private let viewModel = ViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        binding()
        
    }
    
    private func binding() {
        //MARK: 사용자가 텍스트필드를 입력(id, PW)할 때 뷰모델의 옵저버블로 바인딩
        mainView.sampleTextField.rx.text
            .orEmpty
            .bind(to: viewModel.sampleIDTextField)
            .disposed(by: disposeBag)
        
        mainView.sample2TextField.rx.text
            .orEmpty
            .bind(to: viewModel.samplePWTextField)
            .disposed(by: disposeBag)
        
        mainView.sampleTextField.rx.text
            .orEmpty
            .bind(to: mainView.sampleLabel.rx.text)
            .disposed(by: disposeBag)
        
        //버튼 클릭 됐을 떄
        mainView.sampleButton.rx.tap
            .bind {
                self.view.makeToast("버튼이 클릭됐습니다", position: .top)
            }
            .disposed(by: disposeBag)
        
        viewModel.isValid()
            .bind(to: mainView.sampleButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isValid()
            .map { $0 ? 1 : 0.3 }
            .bind(to: mainView.sampleButton.rx.alpha)
            .disposed(by: disposeBag)
        
        mainView.sampleTextField.rx.text
            .orEmpty
            .subscribe {
                print("id: ", $0)
            }
            .disposed(by: disposeBag)
        
        mainView.sample2TextField.rx.text
            .orEmpty
            .subscribe {
                print("PW: ", $0)
            }
            .disposed(by: disposeBag)
    }
}
