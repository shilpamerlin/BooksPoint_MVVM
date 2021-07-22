//
//  APIService.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-07-21.
//

import Foundation

class APIService {
    
    func fetchBooks(closures : @escaping ([Items])->()) {
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=flowers&orderBy=newest&key=AIzaSyCvsSnP-5bU_D5OyovPDyHRhsSd-NaZ3PU"
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
             if error == nil && data != nil{
                 do {
                     let result = try JSONDecoder().decode(Book.self, from: data!)
                    closures(result.items)
                 }
                 catch {
                     print("Error in json parcing\(error)")
                 }
             }
         }
         dataTask.resume()
    }
}
