//
//  SwiftUIView.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/7/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Plane: View {
    @Binding var iterations: CGFloat
    @Binding var dotMaps: [[CXPoint]]

    @State var shapes = [[CXPoint]]()
    @State var points = [CXPoint]()

    @State var touchPoint = CXPoint()
    @State var contained = false

    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Button(action: {
                    dotMaps = .empty
                    shapes = .empty
                    points = []
                    print("Clear Julia Set")
                }, label: {
                    Text("Clear All")
                        .padding(20)
                })
            }
            ZStack {
                Grid()
                MapView(dotMaps: $dotMaps)
                Lines(iterations: $iterations, points: $points, contained: $contained)
                Shapes(shapes: $shapes)
                Layer(iterations: $iterations, touchPoint: $touchPoint, points: $points)
                TouchPad(touchPoint: $touchPoint,
                         dotMaps: $dotMaps,
                         points: $points,
                         contained: $contained,
                         shapes: $shapes)
            }
        }
    }
}
