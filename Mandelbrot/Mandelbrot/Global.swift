//
//  Global.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/7/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

#if os(macOS)
var w: CGFloat = 300
#else
var w = UIScreen.main.bounds.width
#endif


enum Position { case center, right, left }
enum MapMode { case juliaSet, mandelbrot }

var mapMode: MapMode = MapMode.mandelbrot
