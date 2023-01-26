import Foundation

final class SandwichStore : ObservableObject {
    @Published var sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = mockData ) {
        self.sandwiches = sandwiches
    }
}
extension SandwichStore {
    static var mockData = [
        Sandwich(name: "Club", ingredientCount: 4, isSpicy: false),
        Sandwich(name: "Hot dog", ingredientCount: 5, isSpicy: true),
        Sandwich(name: "Pastrami on rye", ingredientCount: 4, isSpicy: true),
        Sandwich(name: "French dip", ingredientCount: 3, isSpicy: false),
        Sandwich(name: "Banh mi", ingredientCount: 5, isSpicy: true),
        Sandwich(name: "Croque madame", ingredientCount: 4, isSpicy: false),
        Sandwich(name: "Banh mi", ingredientCount: 5, isSpicy: true),
        Sandwich(name: "Croque madame", ingredientCount: 4, isSpicy: false),
        Sandwich(name: "Club", ingredientCount: 4, isSpicy: false),
        Sandwich(name: "Hot dog", ingredientCount: 5, isSpicy: true)
    ]
    
    static var testSandwichStore: SandwichStore = SandwichStore(sandwiches: mockData)
}

