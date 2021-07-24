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
    var selectedItem: BookCellModel?
    
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
    
    //MARK:- Dependancy Injection
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    //MARK:- Method to retreive API data via closure
    func getApiData() {
        self.isLoading = true
        apiService.fetchBooks { items in
            self.items = items
            self.processFetchedData(items: items)
            self.isLoading = false
        }
    }
    
    //MARK:- Method to add data to custom cellViewModel
    func processFetchedData(items: [Items]){
        var cellModel = [BookCellModel]()
        for item in items {
            cellModel.append(createCellViewModel(item: item))
        }
        self.cellViewModels = cellModel
    }
    
    //MARK:- Method to create BookCellModel array
    func createCellViewModel(item: Items) -> BookCellModel {
        let result = item.volumeInfo
        let buyLink = item.saleInfo
        let readLink = item.accessInfo
        
        return BookCellModel(title: result.title, author: result.authors?.joined(separator: ", "), category: (result.authors?.joined(separator: ", ")), bookImage: (result.imageLinks?.thumbnail)!, description: result.description, readerLink: readLink.webReaderLink,buyLink: buyLink.buyLink, saleability: buyLink.saleability)
    }
    
    //MARK:- Method to get indexpath of selected item
    func selectedRow(indexPath: IndexPath) {
        selectedItem = cellViewModels[indexPath.row]
    }
}

// MARK:Custom struct used to configure cell
struct BookCellModel {
    let title: String?
    let author: String?
    let category:String?
    let bookImage: String?
    let description: String?
    let readerLink: String?
    let buyLink: String?
    let saleability: String?
}
