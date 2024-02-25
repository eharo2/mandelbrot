//
//  ContentView.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 20.07.19.
//  Copyright © 2019 code3e. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var iterations: CGFloat = 1.0
    @State var map0Dots = [CXPoint]()
    @State var map1Dots = [CXPoint]()
    @State var map2Dots = [CXPoint]()
    @State var map3Dots = [CXPoint]()

    var body: some View {
        VStack {
            Plane(iterations: self.$iterations,
                  map0Dots: self.$map0Dots,
                  map1Dots: self.$map1Dots,
                  map2Dots: self.$map2Dots,
                  map3Dots: self.$map3Dots)
            Gallery(iterations: self.$iterations, map0Dots: self.$map0Dots)
            //Color.black.edgesIgnoringSafeArea(.all)
            }//.background(Color(.black)).edgesIgnoringSafeArea(.all)
    }
}

//struct ContentView: View {
//
//    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
//
//    @State var mapDots = [CXPoint]()
//    @State var points = [CXPoint]()
//    @State var contained = false
//    @State var shapes = [[CXPoint]]()
//
//    var body: some View {
//        GeometryReader { _ in
//            if self.horizontalSizeClass == .compact &&
//                 self.verticalSizeClass == .regular {
//                VStack {
//                    ZStack {
//                        Grid()
//                        Map(mapDots: self.$mapDots)
//                        Lines(points: self.$points, contained: self.$contained)
//                        Shapes(shapes: self.$shapes)
//                        TouchPad(mapDots: self.$mapDots, points: self.$points, contained: self.$contained, shapes: self.$shapes)
//                    }
//                    Panel()
//                    .fixedSize(horizontal: false, vertical: false)
//                    .frame(height: 300)
////                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
//                }
//            } else if self.horizontalSizeClass == .regular &&
//               self.verticalSizeClass == .compact {
//                HStack {
//                    Panel() //Text("LEFT")
//                    ZStack {
//                        Grid()
//                        Map(mapDots: self.$mapDots)
//                        Lines(points: self.$points, contained: self.$contained)
//                        Shapes(shapes: self.$shapes)
//                        TouchPad(mapDots: self.$mapDots, points: self.$points, contained: self.$contained, shapes: self.$shapes)
//                    }
//                }
//            } else if self.horizontalSizeClass == .regular &&
//                self.verticalSizeClass == .regular {
//                Text("iPad Portrait/Landscape")
//            }
//        }
//    }
//}
