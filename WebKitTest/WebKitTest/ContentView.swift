//
//  ContentView.swift
//  WebKitTest
//
//  Created by kangmin on 2022/03/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WebViewModel()
    @State var bar = true
    
    var body: some View {
        VStack {
            WebView(url: "http://192.168.35.2:3000", viewModel: viewModel)
            
            HStack {
                Text(bar ? "Before" : "After")
            
                Button(action: {
                    self.viewModel.foo.send(true)
                }) {
                    Text("보내기")
                }
            }
        }
        .onReceive(self.viewModel.bar.receive(on: RunLoop.main)) { value in
            self.bar = value
        }
    }
}

/*
 struct ContentView: View {
     var body: some View {
         Text("Hello, world!")
             .padding()
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
     }
 }

 */
