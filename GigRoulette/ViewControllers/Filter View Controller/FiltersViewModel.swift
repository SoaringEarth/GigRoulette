//
//  EventsViewModel.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class FiltersViewModel {
    
    let eventsModel = EventsModel.sharedInstance
    
    var selectedGenres : [GenreEntity] = [GenreEntity]()
    
    func getEvents(withCompletionHandler completion: (([EventEntity])->())? = nil, andFailureHandler failure: (()->())? = nil) {
        eventsModel.getAllEvents(withCompletionClosure: completion, andFailureClosure: failure)
    }
    
    func getEvents() -> [EventEntity] {
        return eventsModel.events
    }
    
    func getGenres() -> [GenreEntity] {
        return eventsModel.getGenresFromEvents()
    }
    
    func getSelectedGenres() -> [GenreEntity] {
        return selectedGenres
    }
    
    func select(genre: GenreEntity) {
        selectedGenres.append(genre)
    }
    
    func deSelect(genre: GenreEntity) {
        if selectedGenres.contains(genre) {
            selectedGenres.remove(at: selectedGenres.index(of: genre)!)
        }
    }
    
    func getRandomEvent() -> EventEntity {
        return eventsModel.events.randomElement()
    }
}
