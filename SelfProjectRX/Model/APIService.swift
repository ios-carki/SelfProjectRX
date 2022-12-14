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

struct WeatherData: Codable {
    let temp: Double
    let icon: String
}

final class APIService {
    
//    private init() { }
    
    func netWorkSetting(completionHandler: @escaping ([MyData]) -> Void) {
        
        let url = "\(APIKey.baseURL)\(APIKey.simpleURL)"
        
        AF.request(url, method: .get).validate(statusCode: 200...300).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("ëēĻëĨę°: ", value)
                
                
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
                print("ðððððððė ėīėĻ ę°: ", json)
                
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
    
    func weatherNetworking(latitude: Double, longitude: Double, completionHandler: @escaping (WeatherData) -> Void) {
        let url = "\(WeatherKey.baseURL)lat=\(latitude)&lon=\(longitude)\(WeatherKey.query)\(WeatherKey.openWeatherKey)"
        
        AF.request(url, method: .get).validate(statusCode: 200...300).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("ðððððððė ėīėĻ ę°: ", json)
                
                //var dataList: [WeatherData] = []
//                for i in json.arrayValue {
//                    let userTemp = i["main"]["temp"].doubleValue
//                    let userIcon = i["weather"][0]["icon"].stringValue
//                    let data = WeatherData(temp: userTemp, icon: userIcon)
//                    dataList.append(data)
//                }
                let userTemp = json["main"]["temp"].doubleValue
                let userIcon = json["weather"][0]["icon"].stringValue
                let data = WeatherData(temp: userTemp, icon: userIcon)
//                dataList.append(data)
                completionHandler(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

