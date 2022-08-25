//
//  BooksList.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import Foundation

struct BooksList: Codable {
    let totalCount: Int
    let booksData: [Book]
}
