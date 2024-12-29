import Foundation
import SwiftUI

final class GridPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: GridWireframeInterface

    // Dummy data for grid items
    @Published var items: [String] = (1...20).map { "Item \($0)" }

    // MARK: - Lifecycle

    init(wireframe: GridWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
