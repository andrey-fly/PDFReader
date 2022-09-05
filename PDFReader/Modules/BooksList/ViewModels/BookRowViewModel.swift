//
//  BookRowViewModel.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 31.08.2022.
//

import Foundation

class BookRowViewModel: ObservableObject {
    let book: Book
    @Published private(set) var state: State = .idle
    
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
}
