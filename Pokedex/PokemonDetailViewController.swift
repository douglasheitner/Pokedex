//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Douglas Heitner on 3/31/17.
//  Copyright © 2017 Douglas Heitner. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        mainImage.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attact
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type

    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
