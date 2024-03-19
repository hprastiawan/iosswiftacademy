//
//  ResultModel.swift
//  ProjectPertama
//
//  Created by Macbook on 23/02/24.
//

import Foundation

// MARK: - Welcome
struct LoginResultModel: Codable {
  let message: String

  enum CodingKeys: String, CodingKey {
    case message
  }
}
