//
//  ContentView.swift
//  CardFlip
//
//  Created by Maksim Lamankiy on 04.07.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: Variables
        @State var backDegree = 0.0
        @State var frontDegree = -90.0
        @State var isFlipped = false
        
        let width : CGFloat = 200
        let height : CGFloat = 300
        let durationAndDelay : CGFloat = 0.3
    
    var body: some View {
        ZStack {
            CardFront(width: width, height: height, degree: $frontDegree)
            CardBack(width: width, height: height, degree: $backDegree)
        }.onTapGesture {
            flipCard ()
        }
    }
    
    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardFront: View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    
    var body: some View {
        ZStack {
            Image("cardFront")
                .resizable()
                .frame(width: 200, height: 300)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack: View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    
    var body: some View {
        ZStack {
            Image("cardBack")
                .resizable()
                .frame(width: 200, height: 300)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
