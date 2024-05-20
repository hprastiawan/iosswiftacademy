//
//  ExamplePDFKitViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 25/04/24.
//

import UIKit
import PDFKit

class ExamplePDFKitViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Mengatur background navigation bar menjadi clear
    navigationController?.navigationBar.barTintColor = UIColor.clear
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.isTranslucent = true

    // Path ke file PDF Anda
    guard let pdfURL = Bundle.main.url(forResource: "Mastering-Swift-Swift-programming-language", withExtension: "pdf") else {
      return
    }

    // Buat PDFView
    let pdfView = PDFView(frame: UIScreen.main.bounds)
    view.addSubview(pdfView)

    // Buat dokumen PDF dari URL
    if let document = PDFDocument(url: pdfURL) {
      pdfView.document = document
      // Ambil halaman pertama dari dokumen
      if let page = document.page(at: 3) {
        // Tambahkan highlight ke halaman pertama
        let highlight = PDFAnnotation(bounds: CGRect(x: 100, y: 100, width: UIScreen.main.bounds.width, height: 50), forType: .freeText, withProperties: nil)
        highlight.color = UIColor.yellow.withAlphaComponent(0.9) // Warna highlight
        highlight.contents = "Teks yang ingin ditampilkan" // Tambahkan teks
        page.addAnnotation(highlight)
      }
    }
  }




}
