//
//  ProductsView.swift
//  StoreApp
//
//  Created by User on 10/29/24.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var viewModel = ProductViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.products) { product in
                        NavigationLink(destination:ProductDetailView(product: product)) {
                            ProductRowView(product: product)
                        }
                    }
                }
            }
            .onAppear{
                viewModel.fetchProducts()
            }
        }
    }
}

struct ProductRowView: View {
    let product: Products
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ProductDetailView: View {
    let product: Products
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.title)
                    
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    Text(product.description)
                        .font(.body)
                    
                    Text(product.category)
                        .font(.caption)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductsView()
}
