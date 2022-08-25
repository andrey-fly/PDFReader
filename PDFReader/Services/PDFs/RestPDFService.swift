//
//  RestPDFService.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import Foundation

class RestPDFService: PDFService {
    let baseURLString: String = "https://goalkicker.com"
    
    func downloadPDF(name: String, completion: @escaping (Result<URL, Error>) -> Void) {
        let urlString = baseURLString + "/\(name)Book/\(name)NotesForProfessionals.pdf"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
            
        let task = URLSession.shared.downloadTask(with: request) { downloadLocation, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200, let downloadLocation = downloadLocation, error == nil else { return }
            
            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
            // delete original copy
            try? FileManager.default.removeItem(at: destinationURL)
            // copy from temp to Document
            do {
                try FileManager.default.copyItem(at: downloadLocation, to: destinationURL)
                completion(.success(destinationURL))
            } catch {
                print("Copy Error: \(error.localizedDescription)")
            }
//            let pdfUrl = downloadLocation.deletingPathExtension().appendingPathExtension("pdf")
//            completion(.success(pdfUrl))
        }
        task.resume()
    }
    
//    func getPDFPath(name: String) -> URL {
//        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let pdfPath = documentPath.appendingPathComponent("\(name)", isDirectory: true)
//        do {
//            try FileManager.default.createDirectory(at: pdfPath, withIntermediateDirectories: true)
//        } catch let creatingError {
//            print(creatingError)
//        }
//
//        let pdfFilePath = pdfPath.appendingPathComponent("\(name).pdf")
//        return pdfFilePath
//    }
//
//    func getURLDownloadPDF(name: String, completion: @escaping (Result<URL, Error>) -> Void) {
//        downloadPDF(name: name) { [weak self] res in
//            switch res {
//            case .success(let url):
//                guard let downloadedPDFPath = self?.getPDFPath(name: name) else { return }
//                do {
//                    try FileManager.default.copyItem(at: url, to: downloadedPDFPath)
//                    completion(.success(true))
//                } catch {
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
}
