
import SwiftUI

struct SandwichesListView: View {
    @ObservedObject var viewModel: SandwichesListViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.listData){
                    sandwich in
                    SandwichRow(sandwich: sandwich)
                }.onMove(perform: moveSandwiches)
                    .onDelete(perform: deleteSandwiches)
                HStack{
                    Spacer()
                    Text(viewModel.displayCount)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                }
            }.navigationTitle(viewModel.navTitle)
                .searchable(text: $viewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .automatic),prompt: "Search for Sandwiches")
                .onChange(of: viewModel.searchTerm, perform: { newValue in
                    viewModel.filterSearchResults()
                })
                .animation(.default, value: viewModel.searchTerm)
                .toolbar {
                    HStack{
                        Button("Add", action:makeSandwich)
                        Spacer()
                        EditButton()
                    }
                }
        }
        
    }
    func makeSandwich(){
        withAnimation {
            guard let randomSandwich = viewModel.store.sandwiches.randomElement() else {
                return
            }
            viewModel.makeSandwich(sandwich: randomSandwich)
        }
    }
    
    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            viewModel.moveSandwiches(from: from, to: to)
        }
    }
    
    /// To remove sandwich at specified Index
    /// - Parameter offsets: IndexSet
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            viewModel.deleteSandwiches(offsets: offsets)
        }
    }
}


struct SandwichesListView_Previews: PreviewProvider {
    static var previews: some View {
        SandwichesListView(viewModel: SandwichesListViewModel())
    }
}
