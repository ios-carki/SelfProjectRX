//
//  APIService.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import Foundation

import Alamofire
import Kingfisher
import SwiftyJSON

struct MyData: Codable {
    let name: String
    let photo: String
//
//    enum CodingKeys: String, CodingKey {
//        case name = "username"
//        case photo = "url"
//    }
}

final class APIService {
    
//    private init() { }
    
    func netWorkSetting(completionHandler: @escaping ([MyData]) -> Void) {
        
        let url = "\(APIKey.baseURL)\(APIKey.simpleURL)"
        
        AF.request(url, method: .get).validate(statusCode: 200...300).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("벨류값: ", value)
                print("📕📕📕📕📕📕📕제이슨 값: ", json)
                
                var dataList: [MyData] = []
                for i in json.arrayValue {
                    let userName = i["updated_at"].stringValue
                    let userPhoto = i["profile_image"]["small"].stringValue
                    let data = MyData(name: userName, photo: userPhoto)
                    dataList.append(data)
                    
                }
                completionHandler(dataList)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

