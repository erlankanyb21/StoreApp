//
//  NetworkService.swift
//  StoreApp
//
//  Created by User on 10/29/24.
//

import Foundation

class NetworkService {
    
    func fetchProducts() async throws -> [Products] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Products].self, from: data)
    }
}
