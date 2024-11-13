//
//  MusicViewController.swift
//  collection
//
//  Created by Dilyara Mukhambetova on 11/13/24.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    private var currentMusicAt: Int?
    
    let musicList: [Music] = [
        Music(
            title: "Abbey Road",
            year: "1969",
            poster: #imageLiteral(resourceName: "abbey_road_poster"),
            description: "The Beatles' iconic album featuring classics like 'Come Together' and 'Here Comes the Sun.'"
        ),
        Music(
            title: "Thriller",
            year: "1982",
            poster: #imageLiteral(resourceName: "thriller_poster"),
            description: "Michael Jackson's best-selling album with the hit songs 'Billie Jean' and 'Beat It.'"
        ),
        Music(
            title: "The Dark Side of the Moon",
            year: "1973",
            poster: #imageLiteral(resourceName: "dark_side_of_the_moon_poster"),
            description: "Pink Floyd's influential album with themes of life, mental illness, and time."
        ),
        Music(
            title: "Back in Black",
            year: "1980",
            poster: #imageLiteral(resourceName: "back_in_black_poster"),
            description: "AC/DC's hard rock classic featuring 'Hells Bells' and 'You Shook Me All Night Long.'"
        ),
        Music(
            title: "Rumours",
            year: "1977",
            poster: #imageLiteral(resourceName: "rumours_poster"),
            description: "Fleetwood Mac's album of rock anthems, known for 'Go Your Own Way' and 'Dreams.'"
        ),
        Music(
            title: "Hotel California",
            year: "1976",
            poster: #imageLiteral(resourceName: "hotel_california_poster"),
            description: "The Eagles' classic album with the famous title track 'Hotel California.'"
        ),
        Music(
            title: "Nevermind",
            year: "1991",
            poster: #imageLiteral(resourceName: "nevermind_poster"),
            description: "Nirvana's genre-defining grunge album with hits like 'Smells Like Teen Spirit.'"
        ),
        Music(
            title: "Born in the U.S.A.",
            year: "1984",
            poster: #imageLiteral(resourceName: "born_in_the_usa_poster"),
            description: "Bruce Springsteen's patriotic rock album with 'Dancing in the Dark.'"
        ),
        Music(
            title: "The Wall",
            year: "1979",
            poster: #imageLiteral(resourceName: "the_wall_poster"),
            description: "Pink Floyd's ambitious rock opera exploring isolation and mental walls."
        ),
        Music(
            title: "21",
            year: "2011",
            poster: #imageLiteral(resourceName: "21_poster"),
            description: "Adele's chart-topping album featuring 'Rolling in the Deep' and 'Someone Like You.'"
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell") as! MusicTableViewCell
        let music = musicList[indexPath.row]
        cell.img.image = music.poster
        cell.title.text = music.title
        cell.year.text = music.year
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMusicDetail" {
            let destVC = segue.destination as? MusicDetailViewController
            if let currentMusicAt = currentMusicAt {
                destVC?.configure(with: musicList[currentMusicAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentMusicAt = indexPath.row
        performSegue(withIdentifier: "toMusicDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
