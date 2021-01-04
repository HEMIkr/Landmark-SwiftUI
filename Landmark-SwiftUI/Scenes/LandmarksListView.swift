//
//  ContentView.swift
//  Landmark-SwiftUI
//
//  Created by Aleksander Wędrychowski on 04/01/2021.
//

import SwiftUI

struct LandmarksListView: View {
    var landmarks: [Landmark] = []
    
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationTitle("Landmarks")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks: [Landmark] = try! DataProvider.load(from: "landmarkData.json")
        LandmarksListView(landmarks: landmarks)
    }
}
