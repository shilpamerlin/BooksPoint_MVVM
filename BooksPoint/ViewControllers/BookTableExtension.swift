//
//  BookTableExtension.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-07-21.
//

import Foundation
import UIKit
import SDWebImage

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableView DataSource Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCellModels
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell",for:indexPath) as! BookCell
        let info = viewModel.getCellAtRow(indexpath: indexPath)
        cell.bookTitle.text = info.title
        cell.bookCategory.text = info.category
        cell.bookAuthor.text = info.author
        cell.bookImage.sd_setImage(with: URL(string: info.bookImage!), completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.viewModel.selectedRow(indexPath: indexPath)
        return indexPath
     }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DetailVC
        let selectedItem = viewModel.selectedItem
        controller.selectedObject = selectedItem
    }
}
