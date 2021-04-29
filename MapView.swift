//
//  MapView.swift
//  MyMap
//
//  Created by MOTOORI HIROHIDE on 2021/02/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //検索キーワード
    let searchKey:String
    //表示する View を作成するときに実行
    func makeUIView(context: Context) -> MKMapView{
        //MKMapView のインスタンス生成
        MKMapView()
    } //makeUIViewここまで
    //表示した View が更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchKey ,
                                      completionHandler: {
                                        (placemarks,error) in
                                        if let unwrapPlacemarks = placemarks ,
                                           let firstPlacemark = unwrapPlacemarks.first ,
                                           let location = firstPlacemark.location {
                                            let targetCordinate = location.coordinate
                                            print(targetCordinate)
                                            //ピンを生成
                                            let pin = MKPointAnnotation()
                                            //ピンの置く場所に緯度経度を設定
                                            pin.coordinate = targetCordinate
                                            //ピンのタイトルを設定
                                            pin.title = searchKey
                                            //ピンを地図に置く
                                            uiView.addAnnotation(pin)
                                            //緯度経度を中心にして半径500mの範囲を表示
                                            uiView.region = MKCoordinateRegion(
                                                center: targetCordinate,
                                                latitudinalMeters: 500.0,
                                                longitudinalMeters: 500.0
                                            )
                                        }// ifここまで
                                      })// geocorderここまで
        
    }//updateUIViewここまで
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "龍ケ崎市駅")
    }
}
