//
//  Book.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import Foundation

struct Book: Codable, Identifiable {
    var id = UUID()
    let title: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case title, name
    }
}
