//
//  BookDetailViewModel.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-07-24.
//

import Foundation


class BookDetailViewModel {
    
    var bookViewModel = BookViewModel()
    var bookForSale: (() -> Void) = {}
    var isSale: Bool = true {
        didSet {
            bookForSale()
        }
    }
    
    //MARK:- Method to check Saleability of a specific book
    func bookSaleability(){
        print(bookViewModel.selectedItem)
        var item = bookViewModel.selectedItem
        if item?.saleability == "FOR_SALE" {
            self.isSale = true
        } else {
            self.isSale = false
        }
    }
    
}
