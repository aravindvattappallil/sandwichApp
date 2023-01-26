import Foundation
struct Sandwich: Identifiable {
    
    let id: UUID
    let name: String
    let ingredientCount: Int
    let isSpicy: Bool
    /// Computed properties
    var imageName: String { name }
    var thumbnailName: String { return name + "Thumb" }
    
    
    init(id: UUID = UUID(), name: String, ingredientCount: Int, isSpicy: Bool = false) {
        self.id = id
        self.name = name
        self.ingredientCount = ingredientCount
        self.isSpicy = isSpicy
    }
    
}
