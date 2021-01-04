//
//  Landmark.swift
//  Landmark-SwiftUI
//
//  Created by Aleksander Wędrychowski on 04/01/2021.
//

import SwiftUI
import CoreLocation

struct Landmark: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let isFeatured: Bool
    var isFavorite: Bool
    var locationCoordinate: CLLocationCoordinate2D { .init(latitude: coordinates.latitude, longitude: coordinates.longitude) }
    var image: Image? { Image(imageName) }

    private let coordinates: Coordinates
    private let imageName: String
}
