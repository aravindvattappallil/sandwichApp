
import SwiftUI


final class SandwichesListViewModel : ObservableObject{
   
    
    @ObservedObject var store: SandwichStore
    @Published var navTitle : String = ""
    
    @Published var searchTerm: String = ""
    @Published var searchResults: [Sandwich] = []
    
    /// Computed property to display data
    var listData: [Sandwich] {
        return searchTerm.isEmpty ? store.sandwiches : searchResults
    }
    var displayCount: String {
        "\(listData.count) Sandwiches"
    }
    
    internal init(store: SandwichStore = SandwichStore.testSandwichStore, navTitle: String = "Sandwiches") {
        self.store = store
        self.navTitle = navTitle
    }
    func filterSearchResults() {
        searchResults = store.sandwiches.filter({ $0.name.localizedCaseInsensitiveContains(searchTerm)})
    }
    func makeSandwich(sandwich: Sandwich) {
        store.sandwiches.append(sandwich)
    }
    func deleteSandwiches(offsets: IndexSet) {
        store.sandwiches.remove(atOffsets: offsets)
    }
    
    /// Moves sandwich in Sandwich store
    /// - Parameters:
    ///   - from: IndexSet
    ///   - to: Int
    func moveSandwiches(from: IndexSet, to: Int) {
        store.sandwiches.move(fromOffsets: from, toOffset: to)
    }
}
