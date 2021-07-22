//
//  WelcomeVC.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-07-03.
//

import UIKit
import WebKit
import SDWebImage

class DetailVC: UIViewController, WKUIDelegate {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var btnPurchase: UIButton!
    @IBOutlet weak var btnRead: UIButton!
    var selectedObject : BookCellModel?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //webView.navigationDelegate = self
        navigationItem.largeTitleDisplayMode = .never
        //let selectedItem = selectedObject?.
        bookTitle.text = selectedObject?.title
        bookAuthor.text = selectedObject?.author
        let image = selectedObject?.bookImage
        bookImageView.sd_setImage(with: URL(string: image!), completed: nil)
        bookDescription.text = selectedObject?.description
        btnPurchase.layer.cornerRadius = 5
        btnPurchase.layer.borderWidth = 1
        btnPurchase.layer.borderColor = UIColor.black.cgColor
        
       
        btnRead.layer.cornerRadius = 5
        btnRead.layer.borderWidth = 1
        btnRead.layer.borderColor = UIColor.black.cgColor
        
        }
    
    @IBAction func bookRead(_ sender: Any) {
        let urlString = selectedObject?.readerLink
       loadWebSite(url: urlString!)
        
    }
    
    @IBAction func bookPurchase(_ sender: Any) {
        //let urlString = selectedObject?.buyLink
       // loadWebSite(url: urlString!)
      
    }
    func loadWebSite(url : String){
        webView = WKWebView()
       // webView.navigationDelegate = self
        view = webView
        let webUrl = URL(string: url)
        webView.load(URLRequest(url: webUrl!))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

   

