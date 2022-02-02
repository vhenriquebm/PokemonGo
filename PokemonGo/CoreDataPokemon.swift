//
//  CoreDataPokemon.swift
//  PokemonGo
//
//  Created by Vitor Henrique Barreiro Marinho on 02/02/22.
//

import UIKit
import CoreData


class CoreDataPokemon {
    
    
    func getContext() -> NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        return context!
    }
    
    
    
    
    
    func adicionarTodosPokemons () {
        
        let context = self.getContext()
        
        self.criarPokemon(nome: "Mew", nomeImagem: "mew", capturado: false)
        self.criarPokemon(nome: "Meowth", nomeImagem: "meowth", capturado: false)
        self.criarPokemon(nome: "Pikachu", nomeImagem: "pikachu-2", capturado: true)
        self.criarPokemon(nome: "Squirtle", nomeImagem: "squirtle", capturado: false)
        self.criarPokemon(nome: "Caterpie", nomeImagem: "caterpie", capturado: false)
        self.criarPokemon(nome: "Meowth", nomeImagem: "meowth", capturado: false)

        
        do {
            try context.save()
            
            
            }catch{}
        
    }
    
    
    func criarPokemon(nome:String, nomeImagem: String, capturado:Bool) {
        
        let context = self.getContext()
        let pokemon = Pokemon(context: context)
        pokemon.nome = nome
        pokemon.nomeImagem = nomeImagem
        pokemon.capturado = capturado
        
        
    
    }
    
    
    func recuperarTodosPokemons () -> [Pokemon] {
        
        let context = self.getContext()
        
        do{
           let pokemons = try context.fetch(Pokemon.fetchRequest() ) as [Pokemon]
            if pokemons.count == 0 {
                self.adicionarTodosPokemons()
                return self.recuperarTodosPokemons()
                
            }
            
            return pokemons
        }
        catch{}
        
        return []
        
        }
        
    
}




    

