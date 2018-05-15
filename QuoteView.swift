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
    
    let networking = Networking()
    var quoteData = QuoteData()
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
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
        quoteData = networking.fetchImage()
        backImage.image = quoteData.image
    }
}
