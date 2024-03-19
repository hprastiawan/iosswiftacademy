//
//  ParameterModel.swift
//  ProjectPertama
//
//  Created by Macbook on 22/02/24.
//

import Foundation
import UIKit

struct LoginParam {
    let email, password: String
}

struct User: Codable {
    let email: String
    let username: String
    let userid: String
}

struct AddStoryParam {
    let description: String
    let photo: UIImage
    let lat, lon: Float?
}

struct ProductParam {
    var id: Int?
    var limit: Int?
    var name: String?
    var description: String?
    var priceFrom: Int?
    var priceTo: Int?
    var tags: String?
    var categories: Int?

    init(id: Int? = nil, limit: Int? = 0, name: String? = nil, description: String? = nil, priceFrom: Int? = nil, priceTo: Int? = nil, tags: String? = nil, categories: Int? = nil) {
        self.id = id
        self.limit = limit
        self.name = name
        self.description = description
        self.priceFrom = priceFrom
        self.priceTo = priceTo
        self.tags = tags
        self.categories = categories
    }
}

struct RegisterParam {
    let name, email, password: String
}

struct StoryParam {
    var page, size, location: Int

    init(page: Int = 0, size: Int = 5, location: Int = 0) {
        self.page = page
        self.size = size
        self.location = location
    }
}
