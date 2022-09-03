//
//  PDFReader.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import PDFKit
import SwiftUI
import UIKit

struct PDFReader: UIViewRepresentable {
    
    typealias UIViewType = PDFView
    
    let pdfUrl: URL?

    init(url: URL?) {
        self.pdfUrl = url
    }
    
    func makeUIView(context: Context) -> UIViewType {
        guard let pdfUrl = pdfUrl else { return PDFView() }
        let pdfView = PDFView(frame: .zero)
//        pdfView.maxScaleFactor = Constants.maxScaleFactor
//        pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
//
//        pdfView.displayMode = .singlePage
//        pdfView.displayDirection = .horizontal
//        pdfView.usePageViewController(true, withViewOptions: [UIPageViewController.OptionsKey.interPageSpacing: Constants.interPageSpacing])
        pdfView.displayDirection = .horizontal
        pdfView.usePageViewController(true)
        pdfView.pageBreakMargins = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        pdfView.autoScales = true
        pdfView.displayMode = .singlePage

        
        let document = PDFDocument(url: pdfUrl)
        pdfView.document = document
        
//        guard let pdfScrollView = pdfView.subviews.first?.subviews.first as? UIScrollView else { return UIView(frame: .zero) }
//        pdfScrollView.showsHorizontalScrollIndicator = false
//        pdfScrollView.showsVerticalScrollIndicator = false
        
//        return pdfScrollView
        return pdfView
    }
    
    func updateUIView(_ pdfView: UIViewType, context: UIViewRepresentableContext<PDFReader>) {
        guard let pdfUrl = pdfUrl else { return }
        pdfView.document = PDFDocument(url: pdfUrl)
    }
}
