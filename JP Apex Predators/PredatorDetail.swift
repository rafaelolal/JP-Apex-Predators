//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by Rafael Almeida on 1/6/24.
//

import SwiftUI

struct PredatorDetail: View {
  let predator: ApexPredator
  var body: some View {
    ScrollView {
      VStack(alignment: .trailing) {
        ZStack {
          Image(predator.type).resizable().scaledToFit()

          NavigationLink(destination: Image(predator.name.lowercased()
              .filter { $0 != " " }).resizable().scaledToFit())
          {
            Image(predator.name.lowercased().filter { $0 != " " }).resizable()
              .scaledToFit().frame(
                width: UIScreen.main.bounds.width / 1.5,
                height: UIScreen.main.bounds.height / 4
              ).shadow(color: .black, radius: 6, x: 0, y: 0)
              .rotation3DEffect(
                .degrees(180),
                axis: (x: 0, y: 1, z: 0)
              )
          }
        }
        VStack(alignment: .leading) {
          Text(predator.name).font(.largeTitle).padding(.bottom, 8)

          Text("Appears In:").font(.title3)

          ForEach(predator.movies, id: \.self) { movie in
            Text(movie).font(.subheadline)
          }

          Text("Movie Moments").font(.title).padding(.top, 15)

          ForEach(predator.movieScenes) { scene in
            Text(scene.movie).font(.title2).padding([.top, .bottom], 1)
            Text(scene.sceneDescription).font(.subheadline).padding(.bottom, 15)
          }

          Text("Read More").font(.caption)
          Link(predator.link, destination: URL(string: predator.link)!)
            .font(.caption).foregroundColor(.blue)
        }
      }
    }
  }
}

#Preview {
  let movieScene1 = MovieScene(
    id: 1,
    movie: "Jurassic World: Fallen Kingdom",
    sceneDescription: "The Indoraptor is the main antagonist of the 2018 science fiction adventure film, Jurassic World: Fallen Kingdom, the fifth installment of the Jurassic Park franchise, as well as the second installment of the Jurassic World trilogy. It is a new hybrid dinosaur genetically created by the scientist Henry Wu (on the orders of Eli Mills) in secret within the laboratory of Lockwood Manor. It is the sequel to the Indominus rex, which was known to be created as a weaponized dinosaur hybrid, and the second hybrid created by InGen."
  )

  let movieScene2 = MovieScene(
    id: 2,
    movie: "Jurassic World: Fallen Kingdom",
    sceneDescription: "The Indoraptor is the main antagonist of the 2018 science fiction adventure film, Jurassic World: Fallen Kingdom, the fifth installment of the Jurassic Park franchise, as well as the second installment of the Jurassic World trilogy. It is a new hybrid dinosaur genetically created by the scientist Henry Wu (on the orders of Eli Mills) in secret within the laboratory of Lockwood Manor. It is the sequel to the Indominus rex, which was known to be created as a weaponized dinosaur hybrid, and the second hybrid created by InGen."
  )

  let predator = ApexPredator(
    id: 1,
    name: "Indoraptor",
    type: "land",
    movies: ["Jurassic World: Fallen Kingdom"],
    movieScenes: [movieScene1, movieScene2],
    link: "https://jurassicpark.fandom.com/wiki/Indoraptor"
  )

  return PredatorDetail(predator: predator).preferredColorScheme(.dark)
}
