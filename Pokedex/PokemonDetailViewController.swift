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


    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name

    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
