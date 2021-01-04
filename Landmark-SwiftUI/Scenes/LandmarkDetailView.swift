//
//  LandmarkDetailView.swift
//  Landmark-SwiftUI
//
//  Created by Aleksander Wędrychowski on 04/01/2021.
//

import SwiftUI

struct LandmarkDetailView: View {
    let landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            if let image = landmark.image {
                CircleImage(image: image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
            }
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.primary)
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks: [Landmark] = try! DataProvider.load(from: "landmarkData.json")
        LandmarkDetailView(landmark: landmarks[0])
    }
}
