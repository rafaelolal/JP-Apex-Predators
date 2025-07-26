//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by Rafael Almeida on 1/6/24.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
  var id: Int
  var name: String
  var type: String
  var movies: [String]
  let movieScenes: [MovieScene]
  let link: String

  func typeOverlay() -> Color {
    switch type {
    case "land": return .brown
    case "air": return .teal
    case "sea": return .blue
    default: return .brown
    }
  }
}

struct MovieScene: Codable, Identifiable {
  var id: Int
  var movie: String
  var sceneDescription: String
}
