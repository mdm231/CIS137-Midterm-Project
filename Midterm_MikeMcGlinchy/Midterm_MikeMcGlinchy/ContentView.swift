
//  ContentView.swift
//  Midterm Project
//  Midterm_MikeMcGlinchy
//  Created by Mike McGlinchy on 10/17/25.

import SwiftUI
import Foundation


//function to find json file in apps resource bundle and decode
func loadCategories() -> [Category] {
    guard let url = Bundle.main.url(forResource: "Data", withExtension: "json") else {
        fatalError("Couldn't find data.json in app bundle.")
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Category].self, from: data)
    } catch {
        fatalError("Failed to decode data from bundle: \(error)")
    }
}

//define data structures
struct Category:  Codable, Identifiable {
    let id: String
    let name: String
    let players: [Player]
}

struct Player: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let imageName: String
    let price: String
}

struct ContentView: View {
    //load category data and store it in categories
    let categories: [Category] = loadCategories()

    var body: some View {
        //NavigationStack is a container view, lets user push and pop views
        //from the stack
        NavigationStack {
            
            
            Text("Sports Cards")
            .font(.largeTitle)
            .foregroundStyle(.blue)
            //List is the main container
            List {
                ForEach(categories) { category in
                    Section(header: Text("")) {
                      //  Iterate through players
                        ForEach(category.players) { player in
                            // Wrap the entire HStack in a NavigationLink
                            NavigationLink(destination: PlayerDetailView(player: player)) {
                                HStack {
                                    //display small image and text of player
                                    //on main page
                                    Image(player.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                    VStack(alignment: .leading) {
                                        Text(player.name)
                                            .font(.title)
                                     
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }
    }
}

