//
//  SandwichDetail.swift
//  sw2
//
//  Created by Aravind Vattappallil on 2023-01-25.
//

import SwiftUI

struct SandwichDetail: View {
    @State private var zoomed = false
    var sandwich: Sandwich
    var body: some View {
        VStack {
            Text(sandwich.name)
            Spacer(minLength: 0)
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
            
                // To add tap gesture on an image
                .onTapGesture {
                    withAnimation{
                        zoomed.toggle()
                    }
                }
            
            Spacer(minLength: 0)
            
            if sandwich.isSpicy && !zoomed {
                HStack {
                    Spacer()
                    Label("Spicy", systemImage: "flame.fill")
                    Spacer()
                }
                .padding(.all)
                .font(Font.headline.smallCaps() )
                .background(Color.red)
                .foregroundColor(.yellow)
                .transition(.move(edge: .bottom))
            }
        }
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        SandwichDetail(sandwich: SandwichStore.testSandwichStore.sandwiches[0])
    }
}
