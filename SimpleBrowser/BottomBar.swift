//
//  BottomBar.swift
//  SimpleBrowser
//
//  Created by Bojun Li on 11/12/24.
//


import SwiftUI

import SwiftUI

struct BottomBar: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Button(action: {viewModel.goBack()}) {
                Image(systemName: "chevron.left")
                    .font(.title)
            }
            Spacer()
            Button(action: {viewModel.goForward()}) {
                Image(systemName: "chevron.right")
                    .font(.title)
            }
            Spacer()
            Button(action: {viewModel.share()}) {
                Image(systemName: "square.and.arrow.up")
                    .font(.title)
            }
            Spacer()
            Button(action: {viewModel.refresh()}) {
                Image(systemName: "arrow.clockwise")
                    .font(.title)
            }
            Spacer()
            Button(action: {viewModel.stop()}) {
                Image(systemName: "xmark")
                    .font(.title)
            }
        }
    }
}
