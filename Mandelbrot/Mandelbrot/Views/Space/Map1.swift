//
//  Map1.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/13/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Map1: View {
    @Binding var map1Dots: [CXPoint]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for point in self.map1Dots {
                    path.addDot(center: point.absoluteCoords(in: geometry), size: 1.0)
                }
            }
            .fill(Color(red:1, green: 0, blue: 0, opacity: 1))
        }
        .frame(maxHeight: .infinity).clipped()
    }
}
