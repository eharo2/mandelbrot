//
//  Map.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/17/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct MapView: View {
    @Binding var dotMaps: [[CXPoint]]

    var body: some View {
        ZStack {
            submapView(dotMaps[0], color: .white)  // Points in Set. Green/Red circle
            submapView(dotMaps[1], color: .cyan)   // Yellow dots in axis
            submapView(dotMaps[2], color: .orange) // ?
            submapView(dotMaps[3], color: .green)  // Green dots in axis
        }
    }

    func submapView(_ dotMaps: [CXPoint], color: Color) -> some View {
        GeometryReader { geometry in
            Path { path in
                for point in dotMaps {
                    path.addDot(center: point.absoluteCoords(in: geometry), size: 1.0)
                }
            }
            .fill(color)
        }
        .frame(maxHeight: .infinity).clipped()
    }
}
