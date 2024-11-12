//
//  SearchBar.swift
//  SimpleBrowser
//
//  Created by Bojun Li on 11/11/24.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        HStack {
            Text("URL:")
                .font(.headline)
            
            TextField("Enter URL", text: $viewModel.urlString)
                .keyboardType(.URL)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }
}
