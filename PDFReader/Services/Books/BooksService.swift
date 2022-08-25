//
//  BooksService.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import Foundation

protocol BooksService {
    func getBooksList(completion: @escaping (Result<[Book], Error>) -> Void)
}
