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
}

struct VolumeInfo : Codable {
    
    let authors : [String]?
    let categories : [String]?
    let description : String?
    let pageCount : Int?
    let publishedDate : String?
    let publisher : String?
    let subtitle : String?
    let title : String?

}
