//
//  ProductListModel.swift
//  FiservAssignment
//
//Created by Appleon 12/04/22.
//

import Foundation

struct ProductListModel: Decodable {
    var id: Int
    var title: String
    var price: Double
    var description: String?
    var category: String
    var image: String?
    var rating:Rating?
    
    struct Rating: Decodable {
        var rate:Double
        var count: Int
    }
}
