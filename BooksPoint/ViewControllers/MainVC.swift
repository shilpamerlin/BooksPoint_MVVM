//
//  ViewController.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-06-23.
//

import UIKit


class MainVC: UIViewController {
   
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bookTableView: UITableView!
   
    var selectedIndex : Items?
    var viewModel: BookViewModel = BookViewModel()
   
    override func viewDidLoad() {
       
       super.viewDidLoad()
        initView()
        initViewModel()

       /* fetchBooks { data in
            self.items = data 
           DispatchQueue.main.async {
            self.bookTableView.reloadData()
           }
       } done*/
    }
    
    func initView(){
        title = "Bookshelf"
        bookTableView.tableFooterView = UIView()
        navigationController?.navigationBar.prefersLargeTitles = true
        bookTableView.dataSource = self
        bookTableView.delegate = self
        bookTableView.rowHeight = 150
        viewModel.getApiData()
    }
    
    func initViewModel(){
        viewModel = BookViewModel()
        viewModel.updatingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.activityIndicator.startAnimating()
                    UIView.animate(withDuration: 0.2) {
                        self?.bookTableView.alpha = 0
                    }
                } else {
                    self!.activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 0.2) {
                        self?.bookTableView.alpha = 1.0
                    }
                }
            }
        }
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.bookTableView.reloadData()
            }
        }
        viewModel.getApiData()
    }
    
    
}
    
