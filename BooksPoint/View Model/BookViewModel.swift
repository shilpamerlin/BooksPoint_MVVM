//
//  BookViewModel.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-07-21.
//

import Foundation

class BookViewModel {
    
    var apiService: APIService
    var items: [Items] = []
    var reloadTableViewClosure: (() -> Void) = {}
    var updatingStatus: (() -> Void) = {}
    var selectedItem: BookCellModel!
    private var cellViewModels = [BookCellModel]() {
        didSet {
            self.reloadTableViewClosure()
        }
    
    }
    var numberOfCellModels: Int {
        return cellViewModels.count
    }
    var isLoading: Bool = false {
        didSet{
            updatingStatus()
        }
    }
    
    func getCellAtRow(indexpath: IndexPath) -> BookCellModel{
        return cellViewModels[indexpath.row]
    }
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func getApiData() {
        self.isLoading = true
        apiService.fetchBooks { items in
            self.items = items
            self.processFetchedData(items: items)
            self.isLoading = false
        }
    }
    
    func processFetchedData(items: [Items]){
        var cellModel = [BookCellModel]()
        for item in items {
            cellModel.append(createCellViewModel(item: item))
        }
        self.cellViewModels = cellModel
    }
    
    func createCellViewModel(item: Items) -> BookCellModel {
        let result = item.volumeInfo
        //let buyLink = item.saleInfo
        let readLink = item.accessInfo
        
        return BookCellModel(title: result.title!, author: result.authors!.joined(separator: ", "), category: (result.authors!.joined(separator: ", ")), bookImage: (result.imageLinks?.thumbnail)!, description: result.description!, readerLink: readLink.webReaderLink!)
        //buyLink: buyLink.buyLink!
    }
    
    func selectedRow(indexPath: IndexPath) {
        selectedItem = cellViewModels[indexPath.row]
    }
}

struct BookCellModel {
    let title: String
    let author: String
    let category:String
    let bookImage: String
    let description: String
    let readerLink: String
    //let buyLink: String
}
