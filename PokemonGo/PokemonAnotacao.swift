//
//  PokemonAnotacao.swift
//  PokemonGo
//
//  Created by Vitor Henrique Barreiro Marinho on 02/02/22.
//

import UIKit
import MapKit

class PokemonAnotacao: NSObject, MKAnnotation{

    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init (coordenadas: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coordenadas
        self.pokemon = pokemon
            
    }
    

    
}
