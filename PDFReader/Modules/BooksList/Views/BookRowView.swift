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
            Text(viewModel.book.title)
            Spacer()
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            }
        }
        .contentShape(Rectangle())
    }
}
