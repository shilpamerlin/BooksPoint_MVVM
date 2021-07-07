//
//  BookCell.swift
//  BooksPoint
//
//  Created by Shilpa Joy on 2021-06-24.
//

import UIKit

class BookCell: UITableViewCell {


    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookCategory: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    
    var gradientLayer: CAGradientLayer!

    override func awakeFromNib() {
        super.awakeFromNib()
        bookImage.clipsToBounds = true
        bookImage.layer.borderWidth = 1
        bookImage.layer.borderColor = UIColor.lightGray.cgColor
       
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

}
