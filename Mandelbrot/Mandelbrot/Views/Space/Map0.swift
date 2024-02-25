//
//  Map.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/17/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Map0: View {
    @Binding var map0Dots: [CXPoint]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for point in self.map0Dots {
                    path.addDot(center: point.absoluteCoords(in: geometry), size: 1.0)
                }
            }
            .fill(Color(red:1, green: 1, blue: 1, opacity: 1))
        }
        .frame(maxHeight: .infinity).clipped()
    }
}
