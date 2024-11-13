//
//  MovieViewController.swift
//  collection
//
//  Created by Dilyara Mukhambetova on 11/13/24.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    private var currentMovieAt: Int?
    
    let movieList: [Movie] = [
            Movie(
                title: "The Prestige",
                year: "2006",
                poster: #imageLiteral(resourceName: "prestige"),
                description: "Two rival magicians engage in a bitter feud to create the ultimate illusion, leading to tragedy and obsession."
            ),
            Movie(
                title: "Papillon",
                year: "2017",
                poster: #imageLiteral(resourceName: "papillon"),
                description: "The story of a French prisoner who attempts to escape from a brutal penal colony on Devil’s Island."
            ),
            Movie(
                title: "The Chronicles of Narnia",
                year: "2005",
                poster: #imageLiteral(resourceName: "narnia"),
                description: "Four siblings discover a magical world called Narnia, where they must fight to protect it from an evil queen."
            ),
            Movie(
                title: "The Butterfly Effect",
                year: "2004",
                poster: #imageLiteral(resourceName: "butterfly"),
                description: "A young man learns he can travel back in time to alter events in his life, but with unintended consequences."
            ),
            Movie(
                title: "Now You See Me",
                year: "2003",
                poster: #imageLiteral(resourceName: "now u see me"),
                description: "A group of illusionists pull off bank heists during their performances, outsmarting the authorities."
            ),
            Movie(
                title: "Donnie Darko",
                year: "2001",
                poster: #imageLiteral(resourceName: "donnie"),
                description: "A troubled teenager is plagued by visions of a man in a rabbit costume who manipulates him to commit crimes."
            ),
            Movie(
                title: "127 Hours",
                year: "2010",
                poster: #imageLiteral(resourceName: "127"),
                description: "Based on a true story, a mountain climber is trapped by a boulder and must make a life-changing decision to survive."
            ),
            Movie(
                title: "Dead Poets Society",
                year: "1989",
                poster: #imageLiteral(resourceName: "deadpoets"),
                description: "An English teacher inspires his students to embrace poetry, individuality, and seize the day."
            ),
            Movie(
                title: "Inception",
                year: "2010",
                poster: #imageLiteral(resourceName: "interception"),
                description: "A skilled thief who steals secrets through dreams must plant an idea into the mind of a powerful businessman."
            ),
            Movie(
                title: "Tenet",
                year: "2020",
                poster: #imageLiteral(resourceName: "tenet"),
                description: "A man is armed with only one word, Tenet, as he fights through time-bending missions to prevent World War III."
            )
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        let movie = movieList[indexPath.row]
        cell.img.image = movie.poster
        cell.title.text = movie.title
        cell.year.text = movie.year
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetail" {
            let destVC = segue.destination as? MovieDetailViewController
            if let currentMovieAt = currentMovieAt {
                destVC?.configure(with: movieList[currentMovieAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentMovieAt = indexPath.row
        performSegue(withIdentifier: "toMovieDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
