//
//  Pokemon.swift
//  Pokedex
//
//  Created by Douglas Heitner on 3/29/17.
//  Copyright © 2017 Douglas Heitner. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _evoNextTxt: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        Alamofire.request(self._pokemonURL).responseJSON { response in
            
            if let dict = response.result.value as? [String:AnyObject] {
                
                if let weight = dict["weight"] as? String {
                    self._weight = "W: \(weight)"
                }
                
                if let height = dict["height"] as? String {
                    self._height = "H: \(height)"
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "Att: \(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "Def: \(defense)"
                }
                
                print(self._attack,self._defense,self._weight,self._height)
            }
        
        }
    }
}
