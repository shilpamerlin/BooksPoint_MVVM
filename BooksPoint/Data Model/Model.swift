//
//  Books.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-06-24.
//

import Foundation

struct Book: Codable {
    let items : [Items]
}
struct Items : Codable {
    let id : String?
    let volumeInfo : VolumeInfo
    let saleInfo : SaleInfo
    let accessInfo : AccessInfo
}
struct SaleInfo : Codable {
    let buyLink : String?
}
struct AccessInfo : Codable {
    let webReaderLink : String?
}
struct VolumeInfo : Codable {
    let authors : [String]?
    let categories : [String]?
    let description : String?
    let pageCount : Int?
    let publishedDate : String?
    let publisher : String?
    let title : String?
    let imageLinks : ImageLinks?
    let buyLink : String?
    let webReaderLink : String?
}
struct ImageLinks : Codable {
    let thumbnail : String?
    
}
