//
//  ViewController.swift
//  movies
//
//  Created by Dilyara Mukhambetova on 10/23/24.
//

import UIKit

struct Movie {
    let title: String
    let year: String
    let poster: UIImage
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let movies: [Movie] = [
        Movie(title: "The Prestige", year: "2006", poster: #imageLiteral(resourceName: "prestige")),
        Movie(title: "Papillon", year: "2017", poster: #imageLiteral(resourceName: "papillon")),
        Movie(title: "The Chronicles of Narnia", year: "2005", poster: #imageLiteral(resourceName: "narnia")),
        Movie(title: "The Butterfly Effect", year: "2004", poster: #imageLiteral(resourceName: "butterfly")),
        Movie(title: "Now You See Me", year: "2003", poster: #imageLiteral(resourceName: "now u see me")),
        Movie(title: "Donnie Darko", year: "2001", poster: #imageLiteral(resourceName: "donnie")),
        Movie(title: "127 Hours", year: "2010", poster: #imageLiteral(resourceName: "127")),
        Movie(title: "Dead Poets Society", year: "1989", poster: #imageLiteral(resourceName: "deadpoets")),
        Movie(title: "Inception", year: "2010", poster: #imageLiteral(resourceName: "interception")),
        Movie(title: "Tenet", year: "2020", poster: #imageLiteral(resourceName: "tenet"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.img.image = movie.poster
        cell.title.text = movie.title
        cell.year.text = movie.year
        
        return cell
    }


}

