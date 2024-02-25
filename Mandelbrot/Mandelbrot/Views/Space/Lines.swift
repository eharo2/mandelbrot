//
//  Lines.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 2/23/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Lines: View {
    @Binding var iterations: CGFloat
    @Binding var points: [CXPoint]
    @Binding var contained: Bool

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                self.drawPath(&path, in: geometry)
            }
            .stroke((self.contained ? Color.green : Color.red), lineWidth: 0.5)
        }
        .frame(maxHeight: .infinity).clipped()
    }

    // MARK: - Render
    func drawPath(_ path: inout Path, in geometry: GeometryProxy) {
        if let first = self.points.first {
            var from = first.absoluteCoords(in: geometry)
            var iterations = Int(self.iterations)
            if mapMode == .juliaSet {
                iterations += 1
            }
            if iterations == 10 {
                iterations = self.points.count
            }
            if iterations > self.points.count {
                iterations = self.points.count
            }
            for i in 0..<iterations {
                //print("\(i): \(self.points[i].string())")
                let target = self.points[i].absoluteCoords(in: geometry)
                path.addLine(from: from.point, to: target.point)
                path.addDot(center: target, size: 10)
                from = target
            }
        }
    }
}
