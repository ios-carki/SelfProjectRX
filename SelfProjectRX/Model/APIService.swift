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

struct TMDBData: Codable {
    let title: String
    let image: String
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
                
                
                var dataList: [MyData] = []
                for i in json.arrayValue {
                    let userName = i["user"]["name"].stringValue
                    let userPhoto = i["urls"]["raw"].stringValue
                    let data = MyData(name: userName, photo: userPhoto)
                    dataList.append(data)
                    
                }
                completionHandler(dataList)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tmdbNetworking(completionHandler: @escaping ([TMDBData]) -> Void) {
        let url = "\(TMDBKey.baseURL)\(TMDBKey.popularURL)\(TMDBKey.tmdbKEY)"
        
        AF.request(url, method: .get).validate(statusCode: 200...300).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("📕📕📕📕📕📕📕제이슨 값: ", json)
                
                var dataList: [TMDBData] = []
                for i in json["results"].arrayValue {
                    let userTitle = i["title"].stringValue
                    let userImage = i["poster_path"].stringValue
                    let data = TMDBData(title: userTitle, image: userImage)
                    dataList.append(data)
                }
                completionHandler(dataList)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

