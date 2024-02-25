//
//  Map3.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/14/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Map3: View {
    @Binding var map3Dots: [CXPoint]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for point in self.map3Dots {
                    path.addDot(center: point.absoluteCoords(in: geometry), size: 1.0)
                }
            }
            .fill(Color(red:0, green: 1, blue: 0, opacity: 1))
        }
        .frame(maxHeight: .infinity).clipped()
    }
}
