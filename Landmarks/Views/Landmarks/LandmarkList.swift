//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Khoa Tran on 24/10/2021.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            /*
             List(filteredLandmarks) { landmark  in
             NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
             LandmarkRow(landmark: landmark)
             }
             }
             */
            
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        
        /*
         ForEach(["iPhone SE (2nd generation)",
         "iPhone XS Max"],
         id: \.self) { deviceName in
         LandmarkList()
         .previewDevice(PreviewDevice(rawValue: deviceName))
         .previewDisplayName(deviceName)
         }
         */
    }
}
