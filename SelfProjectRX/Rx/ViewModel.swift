//
//  ViewModel.swift
//  SelfProjectRX
//
//  Created by Carki on 2023/01/11.
//

import Foundation

import RxSwift
import RxCocoa

final class ViewModel {
    
    let sampleIDTextField = BehaviorRelay<String>(value: "")
    let samplePWTextField = BehaviorRelay<String>(value: "")
    let sampleLabel = BehaviorRelay<String>(value: "")
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(sampleIDTextField, samplePWTextField)
            .map { id, pw in
                return id.count > 5 && id.contains("@") && id.contains(".") && pw.count > 5
            }
    }
    
    
}
