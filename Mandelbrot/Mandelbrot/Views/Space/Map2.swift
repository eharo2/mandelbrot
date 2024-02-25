//
//  SwiftUIView.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/13/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Map2: View {
    @Binding var map2Dots: [CXPoint]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for point in self.map2Dots {
                    path.addDot(center: point.absoluteCoords(in: geometry), size: 1.0)
                }
            }
            .fill(Color(red:0, green: 0, blue: 1, opacity: 1))
        }
        .frame(maxHeight: .infinity).clipped()
    }
}
