//
//  DetailView.swift
//  NewsReader
//
//  Created by Bogdan Coticopol on 15/11/2020.
//

import SwiftUI
import WebKit
import UIKit

struct DetailView: View {
    
    let url: String?
    
    func actionSheet(url: String?) {
        guard let url = url, let data = URL(string: url) else { return }
        
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    var body: some View {
        NavigationView {
            WebView(urlString: url)
                .navigationBarItems(trailing:
                                        HStack {
                                            Button(action: {actionSheet(url: self.url)
                                            }, label: {
                                                Image(systemName: "square.and.arrow.up")
                                                    .resizable()
                                                    .frame(width: 25, height: 30)
                                                    .foregroundColor(.blue)
                                            })})
        }
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = urlString, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.ro/")
    }
}
