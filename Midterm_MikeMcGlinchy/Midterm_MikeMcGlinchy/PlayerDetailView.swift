
//PlayerDetailView.swift
//  Midterm Project
//  Midterm_MikeMcGlinchy
//  Created by Mike McGlinchy on 10/17/25.

import SwiftUI

struct PlayerDetailView: View {
    // Declares an immutable property to hold the Player data.
     // The view is initialized with an instance of a Player struct.
    let player: Player
     //The body describes the views content and layout
    var body: some View {
        //arrange the views vertically, centered
        VStack(alignment: .center, spacing: 20) {
            //pushes all content to the center
            Spacer()
            //display the player's image
            Image(player.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 10)
            //displays the player's name
            Text(player.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            //displays the player's card price
            Text(player.price)
                .font(.title2)
                .foregroundColor(.green)
                .fontWeight(.bold)
            //displays the player's description
            Text(player.description)
                .font(.title2)
                .foregroundColor(.secondary)
                .fontWeight(.bold)
            //pushes all content toward the center
            Spacer()
        }
        .padding()
    }
}


