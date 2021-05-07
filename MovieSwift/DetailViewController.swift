//
//  DetailViewController.swift
//  MovieSwift
//
//  Created by MORIO on 9/9/20.
//  Copyright © 2020 MORIO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var fTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    var t = ""
    var i = UIImage()
    var r = 0.0
    var y = 00
    var g = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fTitle.text = t
        img.image = i
        rate.text = String(r)
        year.text = String(y)
        genre.text = g
        
        
    }
    
}
