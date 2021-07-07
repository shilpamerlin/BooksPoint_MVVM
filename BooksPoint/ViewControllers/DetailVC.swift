//
//  WelcomeVC.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-07-03.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var btnPurchase: UIButton!
    @IBOutlet weak var btnRead: UIButton!
    var selectedObject : Items?
    var webView: WKWebView!
    
    override func viewDidLoad() {
       
        
        
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        let selectedItem = selectedObject?.volumeInfo
        bookTitle.text = selectedItem?.title
        bookAuthor.text = selectedItem?.authors?.joined(separator: ", ")
        
        let imageString = (selectedItem?.imageLinks?.thumbnail)!
        if let data = try? Data(contentsOf: imageString) {
                        if let image = UIImage(data: data) {
                            bookImageView.image = image
                        }
            }
        bookDescription.text = selectedItem?.description
       
        btnPurchase.layer.cornerRadius = 5
        btnPurchase.layer.borderWidth = 1
        btnPurchase.layer.borderColor = UIColor.black.cgColor
        
       
        btnRead.layer.cornerRadius = 5
        btnRead.layer.borderWidth = 1
        btnRead.layer.borderColor = UIColor.black.cgColor
        
        }
    
    @IBAction func bookRead(_ sender: Any) {
        let urlString = selectedObject?.volumeInfo.imageLinks?.thumbnail
       print("URL is \(urlString)")
       // let webUrl = URL(string: urlString!)
       
        
    }
    
    @IBAction func bookPurchase(_ sender: Any) {
        let urlString = selectedObject?.volumeInfo.buyLink
        //loadWebSite(url: urlString!)
      
    }
    func loadWebSite(url : String){
        let webUrl = URL(string: url)
        webView.load(URLRequest(url: webUrl!))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

   

