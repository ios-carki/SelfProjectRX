//
//  CollectionMainViewController.swift
//  SelfProjectRX
//
//  Created by Carki on 2022/11/04.
//

import CoreLocation
import UIKit

import Kingfisher

final class CollectionMainViewController: UIViewController {
    
    let mainView = CollectionMainView()
    let apiService = APIService()
    
    let testLikes = ["1", "2", "3", "4"]
    let testImages = [UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star"), UIImage(systemName: "star")]
    
    var netLikes: [MyData] = []
    var tmdbData: [TMDBData] = []
    
    //위치정보 + 날씨API
    var locationManager = CLLocationManager()
    var weatherData: [WeatherData] = []
    var userLatitude: Double?
    var userLongitude: Double?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("받아온 위도: \(userLatitude), 경도: \(userLongitude)")
        collectionSetting()
        userLocationSetup()
        checkUserDeviceLocationServiceAuthorization()
        
//        APIService().netWorkSetting { [weak self] data in
//            self?.netLikes = data
//            self?.mainView.collectionView.reloadData()
//            //netlikes = data
//        }
        
//        APIService().tmdbNetworking { [weak self] data in
//            self?.tmdbData = data
//            self?.mainView.collectionView.reloadData()
//        }
        
        APIService().weatherNetworking(latitude: 37.517829, longitude: 37.517829) { [weak self] data in
            self?.weatherData = data
            self?.mainView.collectionView.reloadData()
        }
    }
    
    func collectionSetting() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(CustomCollectionView.self, forCellWithReuseIdentifier: CustomCollectionView.identifier)
        
    }
    
    func userLocationSetup() {
        //위치정도 델리게이트
        locationManager.delegate = self
        //거리 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //위치데이터 제공 Alert수신
        locationManager.requestWhenInUseAuthorization()
    }
    
    func checkUserDeviceLocationServiceAuthorization() {
        
        let authoriztionStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            //locationManager가 가지고 있는 상태를 가져옴
            authoriztionStatus = locationManager.authorizationStatus
        } else {
            authoriztionStatus = CLLocationManager.authorizationStatus()
        }
        
        //기기 위치 서비스 활성화 여부 체크 locationServicesEnabled()
        //위치데이터 On/Off 판단
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() { //On
                print("사용자 위치데이터 사용 ON 상태")
                self.checkUserCurrentLocationAuthorization(authoriztionStatus)
                print("이건 멀까요📕📕📕📕📕📕", self.locationManager.location?.coordinate)
            } else {
                print("사용자 위치데이터 사용 OFF 상태")
            }
        }
        
    }
    
    //권한별 케이스 메서드
    func checkUserCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        
        switch authorizationStatus {
            
            //앱을 처음 실행해서 권한 확인해야될때
        case .notDetermined:
            print("notDeterminded")
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation() //위치 정보 받아오기 시작
            
            //위치권한 사용 거절
        case .restricted, .denied:
            print("거절됨 -> 아이폰 설정")
            
            //앱 사용중일때만 허용
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            
        default: print("default")
        }
    }
    
}

extension CollectionMainViewController: CLLocationManagerDelegate {
    
    //위치정보 계속 업데이트 -> 위도 경도 받아옴
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        
        var userLatitude: Double?
        var userLongitude: Double?
        
        if let location = locations.first {
            print("위도: \(location.coordinate.latitude)")
            userLatitude = location.coordinate.latitude
            print("경도: \(location.coordinate.longitude)")
            userLongitude = location.coordinate.longitude
        }
        
//        //latitude: userLatitude!, longitude: userLongitude! -> 옵셔널 바인딩 처리법
//        APIService().weatherNetworking(latitude: userLatitude!, longitude: userLongitude!) { [weak self] data in
//            print("dsadfjoisajfioadsjfiojsaiofasdijo: ", userLatitude!, userLongitude!)
//            self?.weatherData = data
//            self?.mainView.collectionView.reloadData()
//        }
    }
    
    //위도 경도 받아오기 에러
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension CollectionMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return weatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionView.identifier, for: indexPath) as! CustomCollectionView
        
//        cell.likesLabel.text = netLikes[indexPath.item].name
//        cell.searchImage.kf.setImage(with: URL(string: netLikes[indexPath.item].photo))
        
        cell.likesLabel.text = "\(weatherData[indexPath.item].temp)"//tmdbData[indexPath.item].title
        cell.searchImage.kf.setImage(with: URL(string: "\(WeatherKey.weatherImageURL)\(weatherData[indexPath.item].icon)@2x.png"))
        return cell
        //http://openweathermap.org/img/wn/01d@2x.png
    }
    
    
}
