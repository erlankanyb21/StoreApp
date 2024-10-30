//
//  NetworkService.swift
//  StoreApp
//
//  Created by User on 10/29/24.
//

import Foundation
import Alamofire

class NetworkService {
    func fetchProducts() async throws -> [Products] {
        let response = await AF.request("https://fakestoreapi.com/products")
            .validate()
            .serializingDecodable([Products].self)
            .response
        
        if let statusCode = response.response?.statusCode {
            print("Status code: \(statusCode)")
        }
        
        let data = try response.result.get()
        
        print(data)
        
        return try response.result.get()
    }
}
