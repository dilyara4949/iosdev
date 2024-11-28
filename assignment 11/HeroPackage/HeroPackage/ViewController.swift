//
//  ViewController.swift
//  HeroPackage
//
//  Created by Dilyara Mukhambetova on 11/29/24.
//

import UIKit
import Alamofire
import Kingfisher

struct Hero: Decodable {
    var name: String
    var powerstats: Powerstats
    var appearance: Appearance
    var biography: Biography
    var images: HeroImage
    
    struct Appearance: Decodable {
        var gender: String
        var race: String
    }
    
    struct Biography: Decodable {
        var fullName: String
    }
    
    struct Powerstats: Decodable {
        var intelligence: Int
        var strength: Int
        var power: Int
        var speed: Int
    }
    
    struct HeroImage: Decodable {
        var md: String
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroIntelligence: UILabel!
    @IBOutlet weak var heroStrength: UILabel!
    @IBOutlet weak var heroGender: UILabel!
    @IBOutlet weak var heroPower: UILabel!
    @IBOutlet weak var heroSpeed: UILabel!
    @IBOutlet weak var heroFullName: UILabel!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroRace: UILabel!
    
    private var hero: Hero?
    
 
    @IBAction func randomizeHero(_ sender: UIButton) {
        let randID = Int.random(in: 1...563)
        getHero(id: randID)
        if self.hero != nil {
            setHero(hero: self.hero!)
        } else {
            setHeroError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func setHero(hero: Hero) {
        heroImage.kf.setImage(with: URL(string: hero.images.md))
        self.heroIntelligence.text = "Intelligence: \(hero.powerstats.intelligence)"
        self.heroStrength.text = "Strength: \(hero.powerstats.strength)"
        self.heroGender.text = "Gender: \(hero.appearance.gender)"
        self.heroPower.text = "Power: \(hero.powerstats.power)"
        self.heroSpeed.text = "Speed: \(hero.powerstats.speed)"
        self.heroFullName.text = hero.biography.fullName
        self.heroName.text = hero.name
        self.heroRace.text = "Race: \(hero.appearance.race)"
    }
        
    private func setHeroError() {
        heroImage.image = UIImage(systemName: "person.fill.questionmark")
        heroIntelligence.text = "Intelligence: N/A"
        heroStrength.text = "Strength: N/A"
        heroGender.text = "Gender: N/A"
        heroPower.text = "Power: N/A"
        heroSpeed.text = "Speed: N/A"
        heroFullName.text = "Unknown Hero"
        heroName.text = "Name: N/A"
        heroRace.text = "Race: N/A"
    }

    private func getHero(id: Int) {
        let heroUrlStr = "https://akabab.github.io/superhero-api/api/id/\(id).json"

        AF.request(heroUrlStr).responseDecodable(of: Hero.self) {response in
            switch response.result {
            case .success(let hero):
                self.hero = hero
            case .failure(let err):
                print(err)
            }
        }
    }
}



