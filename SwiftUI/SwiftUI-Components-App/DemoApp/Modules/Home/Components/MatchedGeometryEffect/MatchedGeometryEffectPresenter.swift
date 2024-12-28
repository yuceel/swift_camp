import Foundation
import SwiftUI

final class MatchedGeometryEffectPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: MatchedGeometryEffectWireframeInterface

    // State for toggling animation
    @Published var isExpanded: Bool = false

    // MARK: - Lifecycle

    init(wireframe: MatchedGeometryEffectWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }

    // MARK: - Animation Handling

    func toggleView() {
        isExpanded.toggle()
    }
}
