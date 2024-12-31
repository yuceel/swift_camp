import Foundation
import SwiftUI

final class TransitionPresenter: ObservableObject {
    
    // MARK: - Properties
    
    private let wireframe: TransitionWireframeInterface

    // MARK: - Lifecycle

    init(wireframe: TransitionWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
