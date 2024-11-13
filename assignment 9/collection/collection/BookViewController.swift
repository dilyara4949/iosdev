//
//  BookViewController.swift
//  collection
//
//  Created by Dilyara Mukhambetova on 11/13/24.
//

import UIKit

class BookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    private var currentBookAt: Int?
    
    let bookList: [Book] = [
        Book(
            title: "To Kill a Mockingbird",
            year: "1960",
            poster: #imageLiteral(resourceName: "to_kill_a_mockingbird_poster"),
            description: "Harper Lee's classic novel exploring racial injustice and moral growth in the American South."
        ),
        Book(
            title: "1984",
            year: "1949",
            poster: #imageLiteral(resourceName: "1984_poster"),
            description: "George Orwell's dystopian novel on totalitarianism, surveillance, and individual freedom."
        ),
        Book(
            title: "The Great Gatsby",
            year: "1925",
            poster: #imageLiteral(resourceName: "the_great_gatsby_poster"),
            description: "F. Scott Fitzgerald's tale of love, wealth, and tragedy in 1920s America."
        ),
        Book(
            title: "Pride and Prejudice",
            year: "1813",
            poster: #imageLiteral(resourceName: "pride_and_prejudice_poster"),
            description: "Jane Austen's witty novel on love, reputation, and social class in Regency England."
        ),
        Book(
            title: "The Catcher in the Rye",
            year: "1951",
            poster: #imageLiteral(resourceName: "the-catcher-in-the-rye-poster"),
            description: "J.D. Salinger's novel following the rebellious teenage protagonist Holden Caulfield."
        ),
        Book(
            title: "The Hobbit",
            year: "1937",
            poster: #imageLiteral(resourceName: "the_hobbit_poster"),
            description: "J.R.R. Tolkien's adventurous tale of Bilbo Baggins in a quest to recover treasure guarded by a dragon."
        ),
        Book(
            title: "Moby-Dick",
            year: "1851",
            poster: #imageLiteral(resourceName: "moby_dick_poster"),
            description: "Herman Melville's story of Captain Ahab's obsessive quest to hunt the white whale, Moby Dick."
        ),
        Book(
            title: "War and Peace",
            year: "1869",
            poster: #imageLiteral(resourceName: "war_and_peace_poster"),
            description: "Leo Tolstoy's epic novel on the lives of five aristocratic families during the Napoleonic Wars."
        ),
        Book(
            title: "The Lord of the Rings",
            year: "1954",
            poster: #imageLiteral(resourceName: "the_lord_of_the_rings_poster"),
            description: "J.R.R. Tolkien's epic fantasy trilogy following the journey to destroy the One Ring."
        ),
        Book(
            title: "The Alchemist",
            year: "1988",
            poster: #imageLiteral(resourceName: "the_alchemist_poster"),
            description: "Paulo Coelho's philosophical novel about a young shepherd's journey to find his personal legend."
        )
    ]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as! BookTableViewCell
        let book = bookList[indexPath.row]
        cell.img.image = book.poster
        cell.title.text = book.title
        cell.year.text = book.year
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBookDetail" {
            let destVC = segue.destination as? BookDetailViewController
            if let currentBookAt = currentBookAt {
                destVC?.configure(with: bookList[currentBookAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentBookAt = indexPath.row
        performSegue(withIdentifier: "toBookDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
