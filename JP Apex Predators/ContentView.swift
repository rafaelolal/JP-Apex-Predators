//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Rafael Almeida on 1/5/24.
//

import SwiftUI

struct ContentView: View {
  let apController = ApexPredatorController()
  @State var sortAlphabetical = false
  @State var currentType = "All"
  @State var currentMovie = "All"
  @State var currentSearch = ""

  var body: some View {
    apController.filterBy(type: currentType, name: currentSearch, movie: currentMovie)

    if sortAlphabetical {
      apController.sortByAlphabetical()
    } else {
      apController.sortByMovieAppearence()
    }

    return NavigationView {
      List {
        ForEach(apController.apexPredators) { predator in
          NavigationLink(destination: PredatorDetail(predator: predator)) {
            PredatorRow(predator: predator)
          }
        }
      }.searchable(text: $currentSearch).navigationTitle("Apex Predators")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button {
              withAnimation {
                sortAlphabetical.toggle()
              }
            } label: {
              if sortAlphabetical {
                Image(systemName: "film")
              } else {
                Image(systemName: "textformat")
              }
            }
          }

          ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
              Picker("Type", selection: $currentType.animation()) {
                ForEach(apController.typeFilters, id: \.self) { type in
                  HStack {
                    Text(type)

                    Spacer()

                    Image(systemName: apController.typeIcon(for: type))
                  }
                }
              }

              Picker("Movie", selection: $currentMovie.animation()) {
                ForEach(apController.movieFilters, id: \.self) { type in
                  HStack {
                    Text(type)
                  }
                }
              }

            } label: {
              Image(systemName: "line.horizontal.3.decrease.circle")
            }
          }
        }
    }
  }
}

#Preview {
  ContentView().preferredColorScheme(.dark)
}
