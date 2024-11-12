//
//  WebView.swift
//  SimpleBrowser
//
//  Created by Bojun Li on 11/12/24.
//


import SwiftUI
import WebKit
import Combine

struct WebView: UIViewRepresentable {
    @ObservedObject var viewModel: ViewModel
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var webViewOptionsSubscriber: AnyCancellable?
        
        init(parent: WebView) {
            self.parent = parent
        }
        
        deinit {
            webViewOptionsSubscriber?.cancel()
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webViewOptionsSubscriber = parent.viewModel.webViewOptionsPublisher.sink { webViewOption in
                switch webViewOption {
                case .back:
                    if webView.canGoBack {
                        webView.goBack()
                    }
                case .forward:
                    if webView.canGoForward {
                        webView.goForward()
                    }
                case .share:
                    self.parent.viewModel.shouldShowShareSheet = true
                    //break
                case .refresh:
                    webView.reload()
                case .stop:
                    webView.stopLoading()
                }
            }
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = URL(string: "https://\(viewModel.urlString)") {
            webView.load(URLRequest(url: url))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
