//
//  Path.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/22/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import CoreGraphics
import SwiftUI

extension Path {
    mutating func addDot(center: CXPoint, size: CGFloat) {
        self.addEllipse(in: CGRect(x: center.x - size/2, y: center.y - size/2, width: size, height: size))
    }

    mutating func addLine(from: CGPoint, to: CGPoint) {
        if abs(from.x) < 500000 && abs(from.y) < 500000 {
            self.move(to: from)
            self.addLine(to: to)
        }
    }

    mutating func addLineCX(from: CXPoint, to: CXPoint) {
        self.move(to: from.point)
        self.addLine(to: to.point)
    }
}
