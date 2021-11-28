//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Khoa Tran on 24/10/2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
