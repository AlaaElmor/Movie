//
//  MoviesTableViewController.swift
//  MovieSwift
//
//  Created by MORIO on 9/9/20.
//  Copyright © 2020 MORIO. All rights reserved.
//

import UIKit
protocol myP {
    func newMovie(title: String, rate: Double, year: Int, image: String, genre: String)
}

class MoviesTableViewController: UITableViewController ,myP {
    func newMovie(title: String, rate: Double, year: Int, image: String, genre: String){
        movies.append(title)
        images.append(image)
        rates.append(rate)
        years.append(year)
        genres.append(genre)
        
        tableView.reloadData()
        print(movies)
    }

    var movies : Array<String> = []
    var images : Array<String> = []
    var rates : Array<Double> = []
    var years : Array<Int> = []
    var genres : Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "PropertyList", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            
            movies = dict.object(forKey: "MoviesTitles") as! Array<String>
            images = dict.object(forKey: "MoviesImages") as! Array<String>
            rates = dict.object(forKey: "MoviesRates") as! Array<Double>
            years = dict.object(forKey: "MoviesYears")as! Array<Int>
            genres = dict.object(forKey: "MoviesGenre") as! Array<String>
        }
        
        self.tableView.rowHeight = 100
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        
        vc?.t = movies[indexPath.row]
        vc?.i = UIImage(named: images[indexPath.row])!
        vc?.r = rates[indexPath.row]
        vc?.y = years[indexPath.row]
        vc?.g = genres[indexPath.row]
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func addNew(_ sender: Any) {
        
        let am = storyboard?.instantiateViewController(identifier: "AddMovie") as? AddMovie
        am?.p = self
        self.navigationController?.pushViewController(am!, animated: true)
    }
    
}
