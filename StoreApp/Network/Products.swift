//
//  Products.swift
//  StoreApp
//
//  Created by User on 10/29/24.
//


struct Products: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}
