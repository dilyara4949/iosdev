//
//  MusicDetailViewController.swift
//  collection
//
//  Created by Dilyara Mukhambetova on 11/13/24.
//

import UIKit

class MusicDetailViewController: UIViewController {

    private var music: Music?

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var musicDescription: UILabel!
       

    override func viewDidLoad() {
        super.viewDidLoad()

        musicTitle.text = music?.title
        musicDescription.text = music?.description
        musicImage.image = music?.poster
    }
       
    func configure(with model: Music?) {
        self.music = model
    }

}
