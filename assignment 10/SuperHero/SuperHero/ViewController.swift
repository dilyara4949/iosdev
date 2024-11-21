//
//  ViewController.swift
//  SuperHero
//
//  Created by Dilyara Mukhambetova on 11/18/24.
//

import UIKit

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
    
 
    @IBAction func randomizeHero(_ sender: UIButton) {
        let randID = Int.random(in: 1...563)
        getHero(id: randID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func ifError(err: Error?) -> Bool {
        guard let err else {
            return false
        }
        print(err.localizedDescription)
        return true
    }
    
    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let urlStr = URL(string: string),
            let img = try? Data(contentsOf: urlStr)
        else { return nil}
        return UIImage(data: img)
    }
    
    private func handeHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.md)
            
            print(hero)
            
            DispatchQueue.main.async {
                self.heroImage.image = heroImage
                self.heroIntelligence.text = "Intelligence: \(hero.powerstats.intelligence)"
                self.heroStrength.text = "Strength: \(hero.powerstats.strength)"
                self.heroGender.text = "Gender: \(hero.appearance.gender)"
                self.heroPower.text = "Power: \(hero.powerstats.power)"
                self.heroSpeed.text = "Speed: \(hero.powerstats.speed)"
                self.heroFullName.text = hero.biography.fullName
                self.heroName.text = hero.name
                self.heroRace.text = "Race: \(hero.appearance.race)"
            }
        } catch {
            DispatchQueue.main.async {
                self.heroImage.image = nil
                self.heroIntelligence.text = ""
                self.heroStrength.text = ""
                self.heroGender.text = ""
                self.heroPower.text = ""
                self.heroSpeed.text = ""
                self.heroFullName.text = ""
                self.heroName.text = "Data not Found. Try again"
                self.heroRace.text = ""
            }
        }
    }
        
        

    private func getHero(id: Int) {
        let heroUrlStr = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let heroUrl = URL(string: heroUrlStr) else { return }
        let requestUrl = URLRequest(url: heroUrl)
        
        URLSession.shared.dataTask(with: requestUrl) { data, response, err in
            guard !self.ifError(err: err) else {
                return
            }
            guard let data else { return }
            self.handeHeroData(data: data)
        }.resume()
    }
}

