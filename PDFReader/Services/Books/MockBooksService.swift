//
//  RestBooksService.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import Foundation

class MockBooksService: BooksService {
    
    enum MockOptions {
        static let rootDirectoryName = "Mock"
        static let fileExtension = "json"
        static let booksFileName = "mock_books_pdf"
    }
    
    var dispatchQueue = DispatchQueue.global(qos: .userInitiated)
    
    func getBooksList(completion: @escaping (Result<[Book], Error>) -> Void) {
        dispatchQueue.async {
            guard let jsonFilePath = Bundle.main.path(forResource: MockOptions.booksFileName, ofType: MockOptions.fileExtension, inDirectory: MockOptions.rootDirectoryName) else { return }
            let url = URL(fileURLWithPath: jsonFilePath)
            guard let data = try? Data(contentsOf: url) else { return }
            do {
                let booksList = try JSONDecoder().decode(BooksList.self, from: data)
                completion(.success(booksList.booksData))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
    }
}
