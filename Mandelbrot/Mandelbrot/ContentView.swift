//
//  ContentView.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 20.07.19.
//  Copyright © 2019 code3e. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var iterations: CGFloat = 5
    @State var dotMaps: [[CXPoint]] = .empty

    var body: some View {
        VStack {
            Plane(iterations: $iterations, dotMaps: $dotMaps)
            Gallery(iterations: $iterations, map0Dots: $dotMaps[0])
        }
    }
}
