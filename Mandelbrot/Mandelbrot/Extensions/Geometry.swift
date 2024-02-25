//
//  Geometry.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/21/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import CoreGraphics
import SwiftUI

extension GeometryProxy {
    func center() -> CGPoint {
        return CGPoint(x: self.size.width/2, y: self.size.height/2)
    }
}
