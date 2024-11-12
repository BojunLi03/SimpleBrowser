//
//  ViewModel.swift
//  SimpleBrowser
//
//  Created by Bojun Li on 11/11/24.
//

import Foundation
import SwiftUI
import Combine

enum WebViewOptions {
    case back
    case forward
    case share
    case refresh
    case stop
}

class ViewModel: ObservableObject {
    @Published var urlString: String = ""
    @Published var shouldShowShareSheet: Bool = false
    
    var webViewOptionsPublisher = PassthroughSubject<WebViewOptions, Never>()
    
    func goBack() {
        webViewOptionsPublisher.send(.back)
    }
    
    func goForward() {
        webViewOptionsPublisher.send(.forward)
    }
    
    func share() {
        webViewOptionsPublisher.send(.share)
    }
    
    func refresh() {
        webViewOptionsPublisher.send(.refresh)
    }
    
    func stop() {
        webViewOptionsPublisher.send(.stop)
    }
}
