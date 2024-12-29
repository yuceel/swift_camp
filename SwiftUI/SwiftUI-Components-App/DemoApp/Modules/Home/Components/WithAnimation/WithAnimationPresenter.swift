import Foundation
import SwiftUI

final class WithAnimationPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: WithAnimationWireframeInterface
    
    //WithAnimation properties
    @Published var isExpanded = false

    // MARK: - Lifecycle

    init(wireframe: WithAnimationWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
