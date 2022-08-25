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
            List(viewModel.books) { book in
                NavigationLink(isActive: $viewModel.isReady, destination: {
                    PDFReader(url: viewModel.pdfUrl)
                }, label: {
                    Text(book.title)
                        .onTapGesture {
                            viewModel.downloadPDF(name: book.name)
                        }
                })
            }
            .navigationTitle(Text("Books"))
        }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
    }
}
