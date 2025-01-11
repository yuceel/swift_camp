import Foundation
import SwiftUI

final class RectanglePresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: RectangleWireframeInterface

    // Rectangle properties
    @Published var size: CGFloat = 100 // Unified size property
    @Published var color: Color = .red

    // MARK: - Lifecycle

    init(wireframe: RectangleWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }

    // MARK: - Actions

    func updateRectangle(size: CGFloat, color: Color) {
        self.size = size
        self.color = color
    }
}
