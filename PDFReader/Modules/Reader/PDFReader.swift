//
//  PDFReader.swift
//  PDFReader
//
//  Created by Andrey Mukhin on 23.08.2022.
//

import UIKit
import SwiftUI
import PDFKit

struct PDFReader: UIViewRepresentable {
    
    let pdfUrl: URL?
    var pdfView: PDFView!

    init(url: URL?) {
        self.pdfUrl = url
    }
    
    enum Constants {
//        static let barButtonSize = CGSize(width: 44, height: 44)
        static let maxScaleFactor: CGFloat = 3
        static let interPageSpacing: CGFloat = 5
//        static let sliderThumbPointSize: CGFloat = 20
//        static let progressLabelFontSize: CGFloat = 12
//        static let stackSpacing: CGFloat = 5
//        static let progressLabelHeight: CGFloat = 10
//        static let progressSliderHeight: CGFloat = 16
    }
    
    func makeUIView(context: Context) -> UIView {
        guard let pdfUrl = pdfUrl else { return UIView(frame: .zero) }
        let pdfView = PDFView(frame: .zero)
        pdfView.maxScaleFactor = Constants.maxScaleFactor
        pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
        
        pdfView.displayMode = .singlePage
        pdfView.displayDirection = .horizontal
        pdfView.usePageViewController(true, withViewOptions: [UIPageViewController.OptionsKey.interPageSpacing: Constants.interPageSpacing])
        
        let document = PDFDocument(url: pdfUrl)
        pdfView.document = document
        
//        guard let pdfScrollView = pdfView.subviews.first?.subviews.first as? UIScrollView else { return UIView(frame: .zero) }
//        pdfScrollView.showsHorizontalScrollIndicator = false
//        pdfScrollView.showsVerticalScrollIndicator = false
        
//        return pdfScrollView
        return pdfView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
