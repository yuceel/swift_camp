import Foundation
import SwiftUI

final class TogglePresenter: ObservableObject {

    // MARK: - Properties
    @Published var arrowDirection: Bool = false
    private let wireframe: ToggleWireframeInterface

    // State properties for animation
    @Published var toggleValue: Bool = false

    // MARK: - Lifecycle

    init(wireframe: ToggleWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }

    // MARK: - Animation Handling

    func toggle() {
        withTransaction(Transaction(animation: .spring())) {
            print("pressed")
            arrowDirection.toggle()
        }
    }
}
