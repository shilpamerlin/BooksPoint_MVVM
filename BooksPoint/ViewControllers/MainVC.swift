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
    var viewModel: BookViewModel = BookViewModel()
   
    // MARK: - Life cycle methods
    override func viewDidLoad() {
       super.viewDidLoad()
        initView()
        initViewModel()
    }
    
    func initView(){
        title = "Bookshelf"
        bookTableView.tableFooterView = UIView()
        navigationController?.navigationBar.prefersLargeTitles = true
        bookTableView.dataSource = self
        bookTableView.delegate = self
    }
    
    //MARK:- Custom method to handle UI update as per view model updates
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
    
