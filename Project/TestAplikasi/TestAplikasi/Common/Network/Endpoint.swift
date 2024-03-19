//
//  Endpoint.swift
//  TestAplikasi
//
//  Created by Macbook on 11/12/23.
//

import Foundation
import Alamofire

enum Endpoint {
    case fetchRocket
    case getDetailRocket(Int)

    func path() -> String {
        switch self {
        case .fetchRocket:
            return "/rockets"
        case .getDetailRocket(let id):
            return "/rockets/\(id)"
        }
    }

    func method() -> HTTPMethod {
        switch self {
        case .fetchRocket, .getDetailRocket(_):
          return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .fetchRocket:
            return nil
        case .getDetailRocket(_):
            let params: [String: Any] = [:]
            return params
        }
    }

    var headers: HTTPHeaders {
        switch self {
        case .fetchRocket,
            .getDetailRocket:
            let params: HTTPHeaders  = [
                "Content-Type": "application/json",

            ]
            return params
        }
    }

    func urlString() -> String {
        return BaseConstant.baseURL + self.path()
    }
}
