//
//  File.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/7/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Panel2: View {

    var body: some View {
        VStack {
            Text("Two")
            .frame(width: w, height: 300)
        }
        .background(Color(.blue))
        .animation(.easeInOut(duration: 0.3))
    }
}
