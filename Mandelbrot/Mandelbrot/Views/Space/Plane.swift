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
    @Binding var map0Dots: [CXPoint]
    @Binding var map1Dots: [CXPoint]
    @Binding var map2Dots: [CXPoint]
    @Binding var map3Dots: [CXPoint]

    @State var touchPoint = CXPoint()
    @State var points = [CXPoint]()
    @State var contained = false
    @State var shapes = [[CXPoint]]()

    var body: some View {
        VStack {
            ZStack {
                Grid()
                Map0(map0Dots: self.$map0Dots)
                Map1(map1Dots: self.$map1Dots)
                Map2(map2Dots: self.$map2Dots)
                Map3(map3Dots: self.$map3Dots)
                Lines(iterations: self.$iterations, points: self.$points, contained: self.$contained)
                Shapes(shapes: self.$shapes)
                Layer(iterations: self.$iterations, touchPoint: self.$touchPoint, points: self.$points)
                TouchPad(touchPoint: self.$touchPoint,
                         map0Dots: self.$map0Dots,
                         map1Dots: self.$map1Dots,
                         map2Dots: self.$map2Dots,
                         map3Dots: self.$map3Dots,
                         points: self.$points,
                         contained: self.$contained,
                         shapes: self.$shapes)
            }
        }//.border(Color.black, width: 1).cornerRadius(10)
    }
}

enum TouchState {
    case none, began, moved, ended
    var name: String {
        return "\(self)"
    }
}
