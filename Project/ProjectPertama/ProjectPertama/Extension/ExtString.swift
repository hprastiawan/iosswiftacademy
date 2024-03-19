//
//  ExtString.swift
//  ProjectPertama
//
//  Created by Macbook on 15/03/24.
//

import Foundation
import UIKit

extension String {
  func isValidEmail() -> Bool {
          // Definisikan pola regex untuk email
          let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

          // Buat objek NSPredicate dengan pola regex
          let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

          // Evaluasi string menggunakan predikat
          return emailPredicate.evaluate(with: self)
      }
}

