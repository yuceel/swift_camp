import Foundation
import SwiftUI

final class FramePresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: FrameWireframeInterface

    // Frame properties
    @Published var size: CGFloat = 150 // Unified property for width and height
    @Published var color: Color = .blue // Color property

    // MARK: - Lifecycle

    init(wireframe: FrameWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
