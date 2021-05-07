//
//  AddMovie.swift
//  MovieSwift
//
//  Created by MORIO on 9/11/20.
//  Copyright © 2020 MORIO. All rights reserved.
//

import UIKit


class AddMovie: UIViewController {

    let objMovie = MoviesTableViewController()
    
    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var newRate: UITextField!
    @IBOutlet weak var newYear: UITextField!
    @IBOutlet weak var newGenre: UITextField!
    @IBOutlet weak var newImage: UITextField!
    
    var p: myP?
    
    var t = ""
    var i = ""
    var r = 0.0
    var y = 00
    var g = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMovie(_ sender: Any) {
        t = newTitle.text!
        i = newImage.text!
        r = (newRate.text! as NSString ).doubleValue
        y = (newYear.text! as NSString ).integerValue
        g = newGenre.text!
        
        p!.newMovie(title: t,rate: r,year: y,image: i,genre: g)
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
}
