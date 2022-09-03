//
//  ContentView.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 20.08.2022.
//

import SwiftUI

struct BooksListView: View {
    @StateObject var viewModel = BooksListViewModel(service: MockBooksService())

    var body: some View {
        NavigationView {
            List(viewModel.books, id: \.id) { book in
                NavigationLink(tag: book.name, selection: $viewModel.selectedBookName) {
                    PDFReader(url: viewModel.pdfUrl)
                        .navigationBarTitle(Text(book.title), displayMode: .inline)
                } label: {
                    let bookVM = BookRowViewModel(book: book)
                    BookRowView(viewModel: bookVM)
                        .onTapGesture {
                            bookVM.state = .loading
                            viewModel.downloadPDF(name: book.name) {
                                bookVM.state = .idle
                            }
                        }
                }
            }
            .navigationBarTitle(Text("Books"))
        }
    }
}
