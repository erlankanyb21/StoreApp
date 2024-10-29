//
//  ProductViewModel.swift
//  StoreApp
//
//  Created by User on 10/29/24.
//
import Foundation

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Products] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private let networkservice = NetworkService()
    
    func fetchProducts() {
        isLoading = true
        
        Task {
            do {
                products = try await networkservice.fetchProducts()
            } catch {
                self.error = error
            }
        }
        
        isLoading = false
    }
}
