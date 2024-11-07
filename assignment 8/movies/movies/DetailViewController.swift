//
//  DetailViewController.swift
//  movies
//
//  Created by Dilyara Mukhambetova on 11/8/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var movie: Movie?

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitle.text = movie?.title
        movieDescription.text = movie?.description
        movieImage.image = movie?.poster
    }
    
    func configure(with model: Movie?) {
        self.movie = model
    }
}
