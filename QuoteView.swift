//
//  QuoteView.swift
//  QuotePro
//
//  Created by Jose on 9/5/18.
//  Copyright © 2018 appcat.com. All rights reserved.
//

import UIKit

class QuoteView: UIView
{
    var quoteData = QuoteData()
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        backImage.image = quoteData.image
        quoteLabel.text = quoteData.quote
        authorLabel.text = quoteData.author
        
        imageButton.layer.borderWidth = 1.5
        imageButton.layer.borderColor = UIColor.init(red: 90.0/255, green: 200.0/255, blue: 250.0/255, alpha: 1.0).cgColor
        
        quoteButton.layer.borderWidth = 1.5
        quoteButton.layer.borderColor = UIColor.init(red: 90.0/255, green: 200.0/255, blue: 250.0/255, alpha: 1.0).cgColor
        
        cancelButton.layer.borderWidth = 1.5
        cancelButton.layer.borderColor = UIColor.init(red: 90.0/255, green: 200.0/255, blue: 250.0/255, alpha: 1.0).cgColor
        
        saveButton.layer.borderWidth = 1.5
        saveButton.layer.borderColor = UIColor.init(red: 90.0/255, green: 200.0/255, blue: 250.0/255, alpha: 1.0).cgColor
    }
    
    @IBAction func imageButtonPressed(_ sender: UIButton)
    {
        Networking.shared.fetchImage
        {
            image in
            
            DispatchQueue.main.async
            {
                self.quoteData.image = image
                self.backImage.image = image
            }
        }
    }
    
    @IBAction func quoteButtonPressed(_ sender: UIButton)
    {
        Networking.shared.fetchQuote
        {
            json in
            
            DispatchQueue.main.async
            {
                self.quoteData.quote = json["quoteText"]!
                self.quoteLabel.text = json["quoteText"]!
                self.quoteData.author = json["quoteAuthor"]!
                self.authorLabel.text = json["quoteAuthor"]!
            }
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton)
    {
        let quoteVC = self.next! as! UIViewController
        let navController = quoteVC.presentingViewController as! UINavigationController
        let tableVC = navController.viewControllers.first as! TableViewController
        
        tableVC.dataArray.append(quoteData)
        tableVC.tableView.reloadData()
        //print(tableVC.dataArray.first.author)
        quoteVC.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton)
    {
        let quoteVC = self.next! as! UIViewController
        quoteVC.dismiss(animated: true, completion: nil)
    }
}
