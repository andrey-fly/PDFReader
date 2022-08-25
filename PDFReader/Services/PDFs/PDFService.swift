//
//  PDFService.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import Foundation

protocol PDFService {
    func downloadPDF(name: String, completion: @escaping (Result<URL, Error>) -> Void)
}
