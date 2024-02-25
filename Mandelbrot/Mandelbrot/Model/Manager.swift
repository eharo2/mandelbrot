//
//  ComplexManager.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/17/20.
//  Copyright © 2020 code3e. All rights reserved.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif
import SwiftUI

class Manager: NSObject {
    class func resultForComplex(_ initial: CXPoint, in geometry: GeometryProxy, mode: MapMode) -> Result {
        switch mode {
        case .juliaSet: return Manager.getConvergence(initial, iterations: 10, in: geometry)
        case .mandelbrot: return Manager.getConvergenceForC(initial, iterations: 200, in: geometry)
        }
    }

    private class func getConvergence(_ initial: CXPoint, iterations: Int, in geometry: GeometryProxy) -> Result {
        var array = [CXPoint]()
        //print("\nJulia Set - Initial point: \(initial.string())")
        var number = initial
        let shapePoints = [CXPoint]()
        var contained = false
        for _ in 0..<iterations {
            let next = number.squared()
            if next.r.isNaN || next.r.isInfinite || next.i.isNaN || next.i.isInfinite {
                break
            }
            next.calculateCoords(in: geometry.size)
            //print("Julia Set - point[\(i)]: \(next.string())")
            array.append(next)
            if abs(number.r) < 0.001 && abs(number.i) < 0.001 {
                contained = true
                break
            }
            number = next
        }
        //print("Julia Set - Total count in array: \(array.count)")
        return Result(numbers: array, contained: contained, shapePoints: shapePoints)
    }

    private class func getConvergenceForC(_ c: CXPoint, iterations: Int, in geometry: GeometryProxy) -> Result {
        var points = [CXPoint]()
        var shapePoints = [CXPoint]()

        var number = CXPoint(r: 0.0, i: 0.0)
        points.append(number)
        var contained = true
        
        for _ in 0..<iterations {
            let next = number.squared().addOperand(c)
            if next.nan() { break }
            next.calculateCoords(in: geometry.size)
            points.append(next)
            number = next
        }

        // Recursive function to detect shape points
        func findAllForFirstIn(array: [CXPoint], resultArray: [CXPoint]) -> [CXPoint] {
            guard array.count > 0 else { return resultArray }
            var rArray = resultArray
            var reference: CXPoint
            var tempArray = [CXPoint]()
            reference = array[0]
            rArray.append(reference)
            let opsArray = Array(array.dropFirst())
            for operand in opsArray {
                if operand.isCloseTo(reference) {
                    reference.counter += 1
                } else {
                    tempArray.append(operand)
                }
            }
            return findAllForFirstIn(array: tempArray, resultArray: rArray)
        }
        
        shapePoints = findAllForFirstIn(array: points, resultArray: shapePoints)
        
        var final = [CXPoint]()
        var count = 0
        for item in shapePoints {
            if item.counter > 25 {
                final.append(item)
                count += item.counter
            }
        }
        if count < 190 || final.count == 1 {
            shapePoints.removeAll()
        } else {
            print("POINTS: \(final.count)")
        }

        //
        if let last = points.last {
            if abs(last.r) > 1.0 || abs(last.i) > 1.0 {
                contained = false
            }
        }
        return Result(numbers: points, contained: contained, shapePoints: shapePoints)
    }

    func testComplex() {
        let op1 = CXPoint(r: 3, i: -2)
        let op2 = CXPoint(r: 1, i: 3)
        let op3 = op1.multiplyBy(op2)
        print(op3)
    }
}
