//
//  Layer.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/9/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Layer: View {
    @Binding var iterations: CGFloat
    @Binding var touchPoint: CXPoint
    @Binding var points: [CXPoint]

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Touch point: \(self.touchPoint.stringComplex())")
                    .padding()
                    .font(.footnote)
                    Spacer()
                }
                Spacer()
                HStack {
                    VStack {
                        Text("Value").padding()
    //                    ForEach(0..<5) {
    //                        Text("\(0) \(self.points[0].stringComplex())").padding()
    //                    }
    //                    for i in 0..<5 {
    //                        Text("\(i) \(self.points[i].stringComplex())").padding()
    //                    }
                    }
                    Spacer()
                }
            }
            Text(getPointString())
                .offset(getOffset())
                .font(.footnote)
        }
    }
    
    func getPointString() -> String {
        guard self.points.count > 1 else { return "" }
        return "\(self.points[1].stringComplex())"
    }
    
    func getOffset() -> CGSize {
        guard self.points.count > 0 else { return CGSize.zero }
        let point = self.points[1]
        let offset: CGFloat = point.i > 0 ? 15 : -15
        return CGSize(width: point.x + offset, height: point.y + offset)
    }
}
