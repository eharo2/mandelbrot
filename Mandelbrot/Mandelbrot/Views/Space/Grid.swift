//
//  Grid.swift
//  DrawingPadSwiftUI
//
//  Created by Enrique Haro on 2/15/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Grid: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                self.addGrid(toPath: &path, withSize: geometry.size)
            }
            .stroke(Color.black, lineWidth: 1)
        }
        .frame(maxHeight: .infinity).clipped()
    }
    
    // MARK: - Add Grid
    func addGrid(toPath path: inout Path, withSize size: CGSize) {
        path.addLine(from: CGPoint(x: 0, y: size.height/2), to: CGPoint(x: size.width, y: size.height/2))
        path.addLine(from: CGPoint(x: size.width/2, y: 0), to: CGPoint(x: size.width/2, y: size.height))

        let center = CGPoint(x: size.width/2, y: size.height/2)
        let factor = size.height > size.width ? size.width/3 : size.height/3
        //print("Pixel-i factor: \(factor)")
        let d: CGFloat = 5
        for i in 1..<4 {
            let delta = CGFloat(i) * factor
            path.addLine(from: CGPoint(x: center.x + delta, y: size.height/2 - d), to: CGPoint(x: center.x + delta, y: size.height/2 + d))
            path.addLine(from: CGPoint(x: center.x - delta, y: size.height/2 - d), to: CGPoint(x: center.x - delta, y: size.height/2 + d))
            path.addLine(from: CGPoint(x: size.width/2 - d, y: center.y - delta), to: CGPoint(x: size.width/2 + d, y: center.y - delta))
            path.addLine(from: CGPoint(x: size.width/2 - d, y: center.y + delta), to: CGPoint(x: size.width/2 + d, y: center.y + delta))
        }
    }
}
