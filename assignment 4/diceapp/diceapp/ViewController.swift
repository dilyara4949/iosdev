//
//  ViewController.swift
//  diceapp
//
//  Created by Dilyara Mukhambetova on 10/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lhsDice: UIImageView!
    @IBOutlet weak var rhsDice: UIImageView!
    
    @IBAction func player(_ sender: Any) {
        let idxL = Int.random(in: 0...5)
        let idxR = Int.random(in: 0...5)
        lhsDice.image = dices[idxL]
        rhsDice.image = dices[idxR]
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var dices = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]

}

