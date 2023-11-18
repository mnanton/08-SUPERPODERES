//
//  CellView.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 15/11/23.
//

import SwiftUI

struct CellView: View {
    var hero: Hero //modelo
    
    var body: some View {
        ZStack{
            //Foto del heroe
            AsyncImage(url: URL(string: hero.thumbnail.path + "." + hero.thumbnail.thumbnailExtension)) { photo in
                //foto descargada
                photo
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }
            
            //VStack para nombre
            VStack(alignment: .leading){
                //name
                HStack{
                    Text(hero.name)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .bold()
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CellView(hero: Hero(
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
        ])
    )
}
