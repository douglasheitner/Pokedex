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
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        return _description ?? ""
    }
    
    var type: String {
        return _type ?? ""
    }
    
    var defense: String {
        return _defense ?? ""
    }
    
    var height: String {
        return _height ?? ""
    }
    
    var weight: String {
        return _weight ?? ""
    }
    
    var attact: String {
        return _attack ?? ""
    }
    
    var nextEvolutionText: String {
        return _nextEvolutionText ?? ""
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(self._pokemonURL).responseJSON { response in
            
            if let dict = response.result.value as? [String:AnyObject] {
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [[String:String]], types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                        
                        if types.count > 1 {
                            
                            for x in 1..<types.count {
                                if let name = types[x]["name"] {
                                    self._type! += "/\(name.capitalized)"
                                }
                        
                            }
                        }
                    } else {
                        self._type = "Undefined"
                    }
                    
                }
            }
        
            completed()
            
        }
    }
}
