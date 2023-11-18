//
//  MainViewModel.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 15/11/23.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published var hero: [Hero]?
    @Published var status = Status.none
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = true){
        if (testing){
            getHeroesTesting()
        } else {
            getHeroes()
        }
    }
    
    
    func getHeroes() {
        print(ApiMarvel().getRequestHeroes())
        
        self.status = .loading
        URLSession.shared
            .dataTaskPublisher(for: ApiMarvel().getRequestHeroes())
            .tryMap{
                // Verificamos respuesta del servidor
                if $0.response.getStatusCode() == 200 {
                    return $0.data
                } else {
                    throw URLError(.badServerResponse)
                }
            }
            .decode(type: [Hero].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = .error(error: "Error Listado Marvel")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.hero = data
            }
            .store(in: &suscriptors)
    }
    
    //for Testing and UI Development
    func getHeroesTesting(){
        self.status = .loading
        self.hero =  getHeroesDesign()
        self.status = .loaded
    }
    
    
    //solo nos vale para Live Preview
    func getHeroesDesign() -> Heroes {
            
        let hero1 = Hero(
            id: 1011334,
            name: "Mortadelo",
            description: "",
            modified: Date(),
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
            comics: Comics(available: 12, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14"),
            ], returned: 12),
            series: Comics(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/1945", name: "Avengers: The Initiative (2007 - 2010)"),
            ], returned: 3),
            stories: Stories(available: 21, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/stories", items: [
                StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/19947", name: "Cover #19947", type: .cover),
            ], returned: 20),
            events: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/events", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/events/269", name: "Secret Invasion")
            ], returned: 1),
            urls: [
                URLElement(type: "detail", url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "wiki", url: "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "comiclink", url: "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab")
            ]
        )
        
        let hero2 = Hero(
            id: 1011335,
            name: "Rompetechos",
            description: "",
            modified: Date(),
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
            comics: Comics(available: 12, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14"),
            ], returned: 12),
            series: Comics(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/1945", name: "Avengers: The Initiative (2007 - 2010)"),
            ], returned: 3),
            stories: Stories(available: 21, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/stories", items: [
                StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/19947", name: "Cover #19947", type: .cover),
            ], returned: 20),
            events: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/events", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/events/269", name: "Secret Invasion")
            ], returned: 1),
            urls: [
                URLElement(type: "detail", url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "wiki", url: "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "comiclink", url: "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab")
            ]
        )
        
        let hero3 = Hero(
            id: 1011336,
            name: "Doctor Bacterio",
            description: "",
            modified: Date(),
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
            comics: Comics(available: 12, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14"),
            ], returned: 12),
            series: Comics(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/1945", name: "Avengers: The Initiative (2007 - 2010)"),
            ], returned: 3),
            stories: Stories(available: 21, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/stories", items: [
                StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/19947", name: "Cover #19947", type: .cover),
            ], returned: 20),
            events: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/events", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/events/269", name: "Secret Invasion")
            ], returned: 1),
            urls: [
                URLElement(type: "detail", url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "wiki", url: "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "comiclink", url: "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab")
            ]
        )
        
        let hero4 = Hero(
            id: 1011337,
            name: "Super López",
            description: "",
            modified: Date(),
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
            comics: Comics(available: 12, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14"),
            ], returned: 12),
            series: Comics(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/series/1945", name: "Avengers: The Initiative (2007 - 2010)"),
            ], returned: 3),
            stories: Stories(available: 21, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/stories", items: [
                StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/19947", name: "Cover #19947", type: .cover),
            ], returned: 20),
            events: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/events", items: [
                ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/events/269", name: "Secret Invasion")
            ], returned: 1),
            urls: [
                URLElement(type: "detail", url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "wiki", url: "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab"),
                URLElement(type: "comiclink", url: "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=562681eca320a890860b8228d3bddeab")
            ]
        )

        
        return [hero1, hero2, hero3, hero4]
        
    }
    
}
