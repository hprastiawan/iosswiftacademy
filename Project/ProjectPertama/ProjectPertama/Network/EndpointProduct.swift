//
//  Endpoint.swift
//  ProjectPertama
//
//  Created by Macbook on 22/02/24.
//

import Foundation
import Alamofire

enum EndpointProduct {
  case login(param: LoginParam)
  case categories
  case products(param: Any)
  case news

  // untuk mengetahui URL string yang akan kita pakai
  var path: String {
    switch self {
    case .login: return "/login"
    case .categories: return "/categories"
    case .products: return "/products"
    case .news: return "/posts"
    }
  }

  // untuk menentukan http methode apa yang di gunakan untuk API
  var method: HTTPMethod {
    switch self {
    case .login: return .post
    case .categories, .products, .news: return .get
    }
  }

  var headers: HTTPHeaders {
    let token = "token1"

    switch self {
    case .login:
      let params: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": "Bearer \(token )",
      ]
      return params
    default:
        let params: HTTPHeaders = [
          "Authorization": "Bearer \(token )",
            "Content-Type": "application/json",
        ]
        return params
    }
  }


  // untuk menentukan param apa yang akan kita pakai di project
  var queryParams: [String: Any]? {
    switch self {
    case .login(let param):
        let params: [String: Any] = [
            "email": param.email,
            "password": param.password
        ]
        return params
    case .products(_):
      let params: [String: Any] = [:]
      return params
    default:
      return nil
    }
  }
  
  // untuk menetukan konfigurasi yang tepat kketika mengirimkan data pada HTTP header
  var encoding: ParameterEncoding {
    switch self {
    case .categories, .products, .news:
      return URLEncoding.queryString
    case .login:
      return JSONEncoding.default
    }
  }

  // untuk menetukan URL dasar dari api yang akan kita pakai
  var urlString: String {
    switch self {
    case .login:
      return BaseConstant.urlMockoon + path
    default:
      return BaseConstant.urlPlaceholder + path
    }

  }
}
