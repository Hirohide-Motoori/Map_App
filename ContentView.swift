//
//  ContentView.swift
//  MyMap
//
//  Created by MOTOORI HIROHIDE on 2021/02/22.
//

import SwiftUI

struct ContentView: View {
    //入力中のの文字列を保持する状態の変数
    @State var inputText:String = ""
    //検索キーワードを保持する状態変数
    @State var dispSerchKey:String = ""
    
    
    var body: some View {
        VStack{
            
            TextField("キーワードを入れてください",
                      text: $inputText , onCommit: {
                        dispSerchKey = inputText
                        
                        print("入力したキーワード" + dispSerchKey)
                      })
                .padding()
            //マップを表示
            MapView(searchKey: dispSerchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
