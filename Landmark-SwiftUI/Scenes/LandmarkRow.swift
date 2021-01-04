//
//  LandmarkRow.swift
//  Landmark-SwiftUI
//
//  Created by Aleksander Wędrychowski on 04/01/2021.
//

import SwiftUI

struct LandmarkRow: View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image?
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks: [Landmark] = try! DataProvider.load(from: "landmarkData.json")
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
