//
//  PhotoViewController.swift
//  Gallery
//
//  Created by Michal on 07.12.2015.
//  Copyright © 2015 Michal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var imageName: String!
    var index: Int!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)
    }
}
