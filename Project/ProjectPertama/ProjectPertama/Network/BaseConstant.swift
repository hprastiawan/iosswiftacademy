//
//  BaseConstant.swift
//  ProjectPertama
//
//  Created by Macbook on 22/02/24.
//

import Foundation

class BaseConstant {
    static let urlMockoon: String = "http://localhost:3000"
    static let urlPlaceholder: String = "https://jsonplaceholder.typicode.com"
    static let urlStory: String = "https://story-api.dicoding.dev/v1"
    static let urlProduct: String = "https://shoe121231.000webhostapp.com/api"



    static let fpcCornerRadius: CGFloat = 24.0
    static let userDef = UserDefaults.standard
    static private let userData = "userData"



    static func deleteUserFromUserDefaults() {
        userDef.removeObject(forKey: userData)
    }
}


import Alamofire

enum HTTPError: Error {
    case badRequest // 400
    case unauthorized // 401
    case forbidden // 403
    case notFound // 404
    case internalServerError // 500
    case serviceUnavailable // 503

    // Tambahkan kasus enum lainnya sesuai kebutuhan
}

// Contoh fungsi yang menggunakan Alamofire untuk melakukan permintaan HTTP
//func fetchDataFromServer() {
//    AF.request("https://example.com/api/data").response { response in
//        switch response.result {
//        case .success(let value):
//            // Handle successful response
//            print("Response: \(value)")
//        case .failure(let error):
//            // Handle failure response
//            if let statusCode = response.response?.statusCode {
//                // Tangani kode status HTTP tertentu dengan enum custom error
//                switch statusCode {
//                case 400:
//                    throw HTTPError.badRequest
//                case 401:
//                    throw HTTPError.unauthorized
//                case 403:
//                    throw HTTPError.forbidden
//                case 404:
//                    throw HTTPError.notFound
//                case 500:
//                    throw HTTPError.internalServerError
//                case 503:
//                    throw HTTPError.serviceUnavailable
//                default:
//                    throw error // Lebih baik melemparkan error asli jika tidak dikenali
//                }
//            } else {
//                // Tangani kesalahan lainnya
//                throw error
//            }
//        }
//    }
//}
//
//// Contoh pemanggilan fungsi
//do {
//    try fetchDataFromServer()
//} catch HTTPError.badRequest {
//    print("Bad Request: 400")
//} catch HTTPError.unauthorized {
//    print("Unauthorized: 401")
//} catch HTTPError.forbidden {
//    print("Forbidden: 403")
//} catch HTTPError.notFound {
//    print("Not Found: 404")
//} catch HTTPError.internalServerError {
//    print("Internal Server Error: 500")
//} catch HTTPError.serviceUnavailable {
//    print("Service Unavailable: 503")
//} catch {
//    print("Error lainnya: \(error.localizedDescription)")
//}

