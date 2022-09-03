//
//  BookRowViewModel.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 31.08.2022.
//

import Foundation

class BookRowViewModel: ObservableObject {
    let book: Book
    @Published var state: State = .idle
    
    enum State {
        case idle
        case loading
    }
    
    init(book: Book) {
        self.book = book
    }
    
    func changeState(state: State) {
        self.state = state
    }
    
//    func downloadPDF() {
//        pdfService.downloadPDF(name: book.name) { [weak self] res in
//            switch res {
//            case .success(let url):
//                DispatchQueue.main.async {
//                    self?.pdfURL = url
//                    self?.readyToPush = true
//                    self?.state = .idle
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
}
