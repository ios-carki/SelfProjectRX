//
//  APIService.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import Foundation

import Alamofire
import Kingfisher

final class APIService {
    
    private init() { }
    
    //func netWorkSetting(completionHanler: @escaping (String, String) -> Void) {
    func netWorkSetting() {
        let url = "\(APIKey.baseURL)\(APIKey.simpleURL)"
        //        AF.request(url,
        //                   method: .get,
        //                   parameters: nil,
        //                   encoding: URLEncoding.default)
        //            .validate(statusCode: 200..<300)
        //            .responseJSON { (json) in
        //                print(json)
        //                completionHanler(json.)
        //        }
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default).validate(statusCode: 200...300).responseJSON { data in
            print(data)
        }
    }
    
    /*
     func getTest() {
             let url = "https://jsonplaceholder.typicode.com/todos/1"
             AF.request(url,
                        method: .get,
                        parameters: nil,
                        encoding: URLEncoding.default,
                        headers: ["Content-Type":"application/json", "Accept":"application/json"])
                 .validate(statusCode: 200..<300)
                 .responseJSON { (json) in
                     //여기서 가져온 데이터를 자유롭게 활용하세요.
                     print(json)
             }
         }
     */
        
        
//        AF.request(api.url, method: .get, headers: api.headers).responseDecodable(of: Profile.self) { response in
//
//                    switch response.result {
//
//                    case .success(let data):
//                        print(data)
//                        completionHandler(data.user.photo, data.user.email, data.user.username)
//                    case .failure(_):
//                        print(response.response?.statusCode)
//                    }
//
//                }
    }

