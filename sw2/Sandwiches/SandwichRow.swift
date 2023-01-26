

import SwiftUI

struct SandwichRow: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)){
            Image(sandwich.thumbnailName).resizable().aspectRatio(contentMode: .fit).cornerRadius(8).frame(width: 50, height: 50 )
            VStack (alignment:.leading){
                Text(sandwich.name)
                
                Text("\(sandwich.ingredientCount) ingredients").font(.subheadline).foregroundColor(.secondary)
               
                }
            if sandwich.isSpicy{
                Image(systemName: "flame.fill")
            }
        }
    }
}

struct SandwichRow_Previews: PreviewProvider {
    static var previews: some View {
        SandwichRow(sandwich: SandwichStore.testSandwichStore.sandwiches[0])
    }
}
