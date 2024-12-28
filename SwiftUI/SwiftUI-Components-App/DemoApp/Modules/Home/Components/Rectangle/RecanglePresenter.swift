import Foundation
import SwiftUI

final class RectanglePresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: RectangleWireframeInterface

    // Rectangle properties
    @Published var width: CGFloat = 100
    @Published var height: CGFloat = 100
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

    func updateRectangle(width: CGFloat, height: CGFloat, color: Color) {
        self.width = width
        self.height = height
        self.color = color
    }
}
