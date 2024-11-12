//
//  ContentView.swift
//  SimpleBrowser
//
//  Created by Bojun Li on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            SearchBar(viewModel: viewModel)
            WebView(viewModel: viewModel)
            BottomBar(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.shouldShowShareSheet) {
            if let url = URL(string: "https://\(viewModel.urlString)") {
                ShareSheet(activityItems: [url])
            }
        }
    }
}
