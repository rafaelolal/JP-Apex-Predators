//
//  PredatorRow.swift
//  JP Apex Predators
//
//  Created by Rafael Almeida on 1/6/24.
//

import SwiftUI

struct PredatorRow: View {
  let predator: ApexPredator

  var body: some View {
    HStack {
      Image(predator.name.lowercased().filter { $0 != " " }).resizable()
        .scaledToFit().frame(
          width: 100,
          height: 100
        ).shadow(color: .white, radius: 1, x: 0, y: 0)

      VStack(alignment: .leading) {
        Text(predator.name).fontWeight(.bold)
        Text(predator.type.capitalized).font(.subheadline).fontWeight(.bold)
          .padding(.horizontal, 13).padding(.vertical, 5)
          .overlay(RoundedRectangle(cornerRadius: 20)
            .fill(predator.typeOverlay().opacity(0.33)))
      }
    }
  }
}

#Preview {
  let movieScene = MovieScene(
    id: 1,
    movie: "Jurassic World: Fallen Kingdom",
    sceneDescription: "The Indoraptor is the main antagonist of the 2018 science fiction adventure film, Jurassic World: Fallen Kingdom, the fifth installment of the Jurassic Park franchise, as well as the second installment of the Jurassic World trilogy. It is a new hybrid dinosaur genetically created by the scientist Henry Wu (on the orders of Eli Mills) in secret within the laboratory of Lockwood Manor. It is the sequel to the Indominus rex, which was known to be created as a weaponized dinosaur hybrid, and the second hybrid created by InGen."
  )

  let predator = ApexPredator(
    id: 1,
    name: "Indoraptor",
    type: "land",
    movies: ["Jurassic World: Fallen Kingdom"],
    movieScenes: [movieScene],
    link: "https://jurassicpark.fandom.com/wiki/Indoraptor"
  )

  return PredatorRow(predator: predator).preferredColorScheme(.dark)
}
