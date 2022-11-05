//
//  CollectionMainViewController.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import UIKit

import Alamofire
import SwiftyJSON


final class CollectionMainViewController: UIViewController {
    
    let mainView = CollectionMainView()
    
    let testLikes = ["1", "2", "3", "4"]
    let testImages = [UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star")]
    
    var netLikes: [String] = []
    let newImages: [String] = []
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSetting()
        netWorkSetting()
    }
    
    func netWorkSetting() {
        
        let url = "\(APIKey.baseURL)\(APIKey.simpleURL)"
        AF.request(url, method: .get).validate(statusCode: 200...300).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
//                print(json[0]["width"])
//                print(json[1]["width"])
//                print(type(of: json[0]["width"]))
//                completionHandler(json[0]["created_at"], json[0]["urls"]["small_s3"])
                self.netLikes.append(json[0]["created_at"].stringValue)
                self.netLikes.append(json[1]["created_at"].stringValue)
                self.netLikes.append(json[2]["created_at"].stringValue)
                print(self.netLikes)
                print(self.netLikes.count)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func collectionSetting() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(CustomCollectionView.self, forCellWithReuseIdentifier: CustomCollectionView.identifier)
        
    }
    
}

extension CollectionMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return netLikes.count
        //return testLikes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionView.identifier, for: indexPath) as! CustomCollectionView
        
        //cell.likesLabel.text = testLikes[indexPath.item]
        cell.likesLabel.text = netLikes[indexPath.item]
        cell.searchImage.image = testImages[indexPath.item]
        
        
        return cell
    }
    
    
}
