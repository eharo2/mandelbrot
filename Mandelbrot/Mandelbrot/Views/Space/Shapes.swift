//
//  Shapes.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 2/22/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

import SwiftUI

struct Shapes: View {
    @Binding var shapes: [[CXPoint]]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                self.drawPath(&path, in: geometry)
            }
            .stroke(Color.red, lineWidth: 1.0)
        }
        .frame(maxHeight: .infinity).clipped()
    }

    // MARK: - Render
    func drawPath(_ path: inout Path, in geometry: GeometryProxy) {
        for shape in shapes {
            if let first = shape.first {
                var from = first.absoluteCoords(in: geometry)
                for i in 1..<shape.count {
                    let target = shape[i].absoluteCoords(in: geometry)
                    path.addLine(from: from.point, to: target.point)
                    from = target
                }
            }
        }
    }
}
