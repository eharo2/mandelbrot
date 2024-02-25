//
//  Complex.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/14/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import CoreGraphics
import SwiftUI

class CXPoint {
    // Complex
    var r: Double = 0
    var i: Double = 0
    var counter = 1
    // Coords
    var x: CGFloat = 0
    var y: CGFloat = 0
    var point: CGPoint {
        return CGPoint(x: self.x, y: self.y)
    }
    
    // Complex
    init() { }

    init(r: Double, i: Double) {
        self.r = r
        self.i = i
    }

    func squared() -> CXPoint {
        return self.multiplyBy(self)
    }

    func addOperand(_ operand: CXPoint) -> CXPoint {
        return CXPoint(r: (self.r + operand.r), i: (self.i + operand.i))
    }

    func multiplyBy(_ op2: CXPoint) -> CXPoint {
        let op1 = self
        let a1 = op1.r * op2.r
        let b1 = op1.r * op2.i
        let a2 = op1.i * op2.r
        let b2 = op1.i * op2.i
        let result = CXPoint(r: a1 - b2, i: b1 + a2)
        return result
    }

    func isCloseTo(_ operand: CXPoint) -> Bool {
        let delta = 0.001
        if  abs(self.r - operand.r) < delta &&
            abs(self.i - operand.i) < delta {
            return true
        }
        return false
    }

    func isCloseWithAnyTo(_ operand: CXPoint) -> Bool {
        let delta = 0.0025
        if  abs(self.r - operand.r) < delta ||
            abs(self.i - operand.i) < delta {
            return true
        }
        return false
    }

    func averageWith(_ operand: CXPoint) -> CXPoint {
        let average = CXPoint(r: (self.r + operand.r)/2, i: (self.i + operand.r)/2)
        average.counter = self.counter + operand.counter
        return average
    }

    func nan() -> Bool {
        if  self.r.isNaN ||
            self.r.isInfinite ||
            self.i.isNaN ||
            self.i.isInfinite {
            return true
        }
        return false
    }
    
    func calculateCoords(in size: CGSize) {
        let limit: CGFloat = 1000000
        let factor = size.height > size.width ? size.width/3 : size.height/3
        var x = CGFloat(self.r) * factor
        var y = CGFloat(self.i) * factor
        if x >  limit { x =  limit }
        if x < -limit { x = -limit }
        if y >  limit { y =  limit }
        if y < -limit { y = -limit }
        self.x = x
        self.y = y
    }

    func string() -> String {
        return("\(self.stringComplex()) \(self.stringCoords())")
    }

    func stringComplex() -> String {
        let r = round(self.r * 100.0)/100.0
        let i = round(self.i * 100.0)/100.0
        if i < 0 {
            return "(\(r) + \(abs(i))i)"
        } else {
            return "(\(r) - \(abs(i))i)"
        }
    }

    // Coords
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }

    init(cgPoint: CGPoint, in geometry: GeometryProxy) {
        self.x = point.x
        self.y = point.y
        self.calculateComplex(in: geometry.size)
    }

    init(geometry: GeometryProxy) {
        self.x = geometry.size.width/2
        self.y = geometry.size.height/2
    }

    init(absolutePoint point: CGPoint, in geometry: GeometryProxy) {
        let center = geometry.center()
        self.x = point.x - center.x
        self.y = point.y - center.y
        self.calculateComplex(in: geometry.size)
    }

    func absoluteCoords(in geometry: GeometryProxy) -> CXPoint {
        let center = CGPoint(x: geometry.size.width/2, y: geometry.size.height/2)
        return CXPoint(x: center.x + point.x, y: center.y + point.y)
    }

    private func calculateComplex(in size: CGSize) {
        let factor = size.height > size.width ? size.width/3 : size.height/3
        self.r = Double(self.x/factor)
        self.i = Double(self.y/factor)
    }

    func stringCoords() -> String {
        return "(\(Int(self.x)), \(Int(self.y)))"
    }
}
