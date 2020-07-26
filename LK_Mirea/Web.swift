//
//  Web.swift
//  LK_Mirea
//
//  Created by Mikhail Kolkov  on 01.07.2020.
//  Copyright © 2020 MKM.LLC. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit
import Firebase

struct WebView: UIViewRepresentable {
    var url : String
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    func updateUIView(_ uiView: WebView.UIViewType, context: UIViewRepresentableContext<WebView>) {
        
    }
    
}
