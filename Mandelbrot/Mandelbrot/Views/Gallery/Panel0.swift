//
//  File.swift
//  Mandelbrot
//
//  Created by Enrique Haro on 3/7/20.
//  Copyright © 2020 code3e. All rights reserved.
//

import SwiftUI

struct Panel0: View {
    @Binding var iterations: CGFloat
    @Binding var map0Dots: [CXPoint]
    @Binding var presentGuide: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Julia Set    x' = x" + "\u{00B2}").font(.largeTitle)
                Spacer()
                Button(action:  {
                    self.presentGuide = true
                }) {
                    Text("\u{24d8}").font(.title)
                }
                Spacer().frame(width: 10, alignment: .trailing)
            }
            Text("Start with any point in the complex plane and get its square.\nStart with one, and increase the number of iterations.\nSome numbers generate a secuence of powers that converge to 0, but others grow exponentially to infinity.\nMapping the numbers that converge to 0 (in Blue), we get a collection of points known as Julia Set.").padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            HStack {
                Spacer().frame(width: 20)
                Text("Iterations: \((Int(self.iterations) == 10) ? "Max" : String(Int(self.iterations)))").font(.subheadline)
                Spacer()
                VStack {
                    HStack {
                        Spacer().frame(width: 10, alignment: .leading)
                        Text("1")
                        Spacer()
                        Text("Max")
                        Spacer().frame(width: 0, alignment: .trailing)
                    }
                    Slider(value: self.$iterations, in: CGFloat(1)...CGFloat(10))
                    .padding(.top, -8)
                }.frame(width: w/2)
                Spacer().frame(width: 20, alignment: .trailing)
            }.padding(.top, 20)
            HStack {
                Button(action:  {
                    self.map0Dots.removeAll()
                    print("Clear Julia Set")
                }) {
                    Text("Clear Julia Set")
                    .padding(6)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                }
                .cornerRadius(6)
                Button(action:  {
                    print("Button2")
                }) {
                    Text("Other")
                    .padding(6)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                }
                .cornerRadius(6)
                //Spacer()
            }
            Spacer(minLength: 24)
        }
        .frame(width: w - 6, height: 300)
        .font(.footnote)
        .animation(.easeInOut(duration: 0.3))
        .onTapGesture {
            print("Show")
        }
    }
}
