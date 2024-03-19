//
//  NetworkManager.swift
//  ProjectPertama
//
//  Created by Macbook on 22/02/24.
//

import Foundation
import Alamofire

public enum HTTPStatusCode: Int {
  case success = 200
  case created = 201
  case noContent = 204
  case badRequest = 400
  case unauthorized = 401
  case forbidden = 403
  case notFound = 404
  case conflic = 409
  case limit = 429
  case internalServerError = 500
  case serviceUnvaliable = 503
}

struct CustomError: Error {
    let statusCode: HTTPStatusCode
    let message: String

    var errorDescription: String? {
        return "HTTP Status Code \(statusCode.rawValue): \(message)"
    }
}

struct StatusResponse: Codable{
    let message: String
    let status: String

    enum CodingKeys: String, CodingKey {
      case message, status
    }

}

class NetworkManager {

  static let shared = NetworkManager()
  
  public func fetchProductRequest<T: Codable>(endpoint: EndpointProduct, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
    AF.request(endpoint.urlString,
               method: endpoint.method,
               parameters: endpoint.queryParams,
               encoding: endpoint.encoding,
               headers: endpoint.headers)
    .validate()
    .responseDecodable(of: T.self) { response in
      switch response.result {
      case .success(let item):
        completion(.success(item))
      case .failure:
        if let statusCode = response.response?.statusCode,
           let httpStatusCode = HTTPStatusCode(rawValue: statusCode),
           let data = response.data,
           let errorResponse = try? JSONDecoder().decode(StatusResponse.self, from: data) {

          var customError: CustomError?

          switch httpStatusCode {
          case HTTPStatusCode.serviceUnvaliable:
            customError = CustomError(statusCode: httpStatusCode, message: "Internet Unvailable")
            break
          case HTTPStatusCode.limit:
            customError = CustomError(statusCode: httpStatusCode, message: "Limit request, try again in a while")
            break
          default:
            customError = CustomError(statusCode: httpStatusCode, message: errorResponse.message)
            break
          }
          completion(.failure(customError!))
        } else {
          completion(.failure(CustomError(statusCode: HTTPStatusCode.internalServerError, message: "Server Error")))
        }
        break
      }
    }
  }
}
