//
//  BookRowView.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 31.08.2022.
//

import SwiftUI

struct BookRowView: View {
    @ObservedObject var viewModel: BookRowViewModel

    var body: some View {
        HStack {
            switch viewModel.state {
            case .idle:
                Text(viewModel.book.title)
            case .loading:
                Text(viewModel.book.title)
                Spacer()
                ProgressView()
            }
        }
    }
}
