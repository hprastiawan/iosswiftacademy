//
//  UserListModel.swift
//  ProjectPertama
//
//  Created by Macbook on 25/02/24.
//

import Foundation

// MARK: - WelcomeElement
struct PlaceHolderElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PlaceHolder = [PlaceHolderElement]
