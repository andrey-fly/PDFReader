//
//  BooksListViewModel.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import Foundation

class BooksListViewModel: ObservableObject {
    let service: BooksService
    let pdfService: PDFService
    @Published var books: [Book]
    @Published var selectedBookName: String?
    var pdfUrl: URL?
    
    init(service: BooksService) {
        self.service = service
        self.pdfService = RestPDFService()
        self.books = .init()
        getBooks()
    }
    
    func getBooks() {
        service.getBooksList { [weak self] res in
            switch res {
            case .success(let booksList):
                DispatchQueue.main.async {
                    self?.books = booksList
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func downloadPDF(name: String, completion: (() -> ())?) {
        pdfService.downloadPDF(name: name) { [weak self] res in
            switch res {
            case .success(let url):
                DispatchQueue.main.async {
                    self?.pdfUrl = url
                    self?.selectedBookName = name
                    completion?()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
