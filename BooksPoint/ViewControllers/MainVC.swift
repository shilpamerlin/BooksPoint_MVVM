//
//  ViewController.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-06-23.
//

import UIKit


class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var bookslideShow: UIView!
    @IBOutlet weak var bookTableView: UITableView!
    var items : [Items] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpeg")!)
        fetchBooks { data in
            self.items.self = data
            DispatchQueue.main.async {
                self.bookTableView.reloadData()
            }
        }
        bookTableView.dataSource = self
        bookTableView.rowHeight = 125
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell",for:indexPath) as! BookCell
        
        let info = items[indexPath.row].volumeInfo
        cell.bookTitle.text = info.title
        cell.bookCategory.text = info.categories?.joined(separator: ",")
        cell.bookAuthor.text = info.authors?.joined(separator: ", ")

        return cell
    }
    
    func fetchBooks(comp : @escaping ([Items])->()){
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=quilting"
        let url = URL(string: urlString)
         
         guard url != nil else {
             return
         }
         let session = URLSession.shared
         
         let dataTask = session.dataTask(with: url!) { [self] (data, response, error) in
             //check for errors
             if error == nil && data != nil{
           
                 //parse json
                 
                 do {
                     let result = try JSONDecoder().decode(Book.self, from: data!)
                    comp(result.items)
                    
                     print("Retrieved books are \(items)")
                 }
                 catch {
                     print("Error in json parcing\(error)")
                 }
             }
         }
         //make api call
         dataTask.resume()
         
    }
}
    
