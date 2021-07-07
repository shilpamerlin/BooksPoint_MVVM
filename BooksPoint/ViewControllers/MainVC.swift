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
    var selectedIndex : Items?
   
    override func viewDidLoad() {
       
       super.viewDidLoad()
       title = "Bookshelf"
       bookTableView.tableFooterView = UIView()
       navigationController?.navigationBar.prefersLargeTitles = true
       bookTableView.dataSource = self
       bookTableView.delegate = self
        bookTableView.rowHeight = 150
        
        fetchBooks { data in
            self.items = data // not sure what the extra self is?
           DispatchQueue.main.async {
            self.bookTableView.reloadData()
           }
       }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell",for:indexPath) as! BookCell
        let info = items[indexPath.row].volumeInfo
        cell.bookTitle.text = info.title
        cell.bookCategory.text = info.categories?.joined(separator: ",")
        cell.bookAuthor.text = info.authors?.joined(separator: ", ")
        
        let imageString = (info.imageLinks?.thumbnail)!

        
        if let data = try? Data(contentsOf: imageString) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                cell.bookImage.image = image
                            }
                        }
                    }
        return cell
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detail"
        {
            let controller = segue.destination as! DetailVC
            controller.selectedObject = selectedIndex
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        selectedIndex = items[row]
        self.performSegue(withIdentifier: "detail", sender: self)
        
     }
    
    func fetchBooks(comp : @escaping ([Items])->()){
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=flowers&orderBy=newest&key=AIzaSyCvsSnP-5bU_D5OyovPDyHRhsSd-NaZ3PU"
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
    
