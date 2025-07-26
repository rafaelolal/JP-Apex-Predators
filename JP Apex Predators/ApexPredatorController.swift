//
//  ApexPredatorController.swift
//  JP Apex Predators
//
//  Created by Rafael Almeida on 1/6/24.
//

import Foundation

class ApexPredatorController {
  var allApexPredators: [ApexPredator] = []
  var apexPredators: [ApexPredator] = []
  let typeFilters = ["All", "Land", "Air", "Sea"]
  var movieFilters = ["All"]

  init() {
    decodeApexPredatorData()
    movieFilters += Set(allApexPredators.flatMap { $0.movies }).sorted()
  }

  func decodeApexPredatorData() {
    if let url = Bundle.main.url(
      forResource: "jpapexpredators",
      withExtension: "json"
    ) {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(
          [ApexPredator].self,
          from: data
        )
        allApexPredators = decodedData
        apexPredators = decodedData
      } catch {
        print(error)
      }
    }
  }

  func typeIcon(for type: String) -> String {
    switch type {
    case "Land":
      return "leaf.fill"
    case "Air":
      return "wind"
    case "Sea":
      return "drop.fill"
    default:
      return "square.stack.3d.up.fill"
    }
  }

  func filterBy(type: String, name: String, movie: String) {
    apexPredators = allApexPredators

    if type != "All" {
      apexPredators = apexPredators.filter { $0.type == type.lowercased() }
    }

    if name != "" {
      apexPredators = apexPredators
        .filter { $0.name.lowercased().contains(name.lowercased()) }
    }

    if movie != "All" {
      apexPredators = apexPredators.filter { $0.movies.contains(movie) }
    }
  }

  func sortByAlphabetical() {
    apexPredators.sort(by: { $0.name < $1.name })
  }

  func sortByMovieAppearence() {
    apexPredators.sort(by: { $0.id > $1.id })
  }
}
