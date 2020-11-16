//
//  ContentView.swift
//  NewsReader
//
//  Created by Bogdan Coticopol on 15/11/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text("\(post.points)").font(Font.custom("Menlo", size: 10))
                            Text(post.title).font(Font.custom("Menlo", size: 16))
                        }
                    })
                
            }
            .navigationTitle("H4X0R News")
            .navigationBarItems(trailing:
                                    Button(action: {self.networkManager.fetchData()}, label: {
                                        Image(systemName: "arrow.clockwise")
                                            .resizable()
                                            .frame(width: 25, height: 30)
                                            .foregroundColor(.black)
                                    }))
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


