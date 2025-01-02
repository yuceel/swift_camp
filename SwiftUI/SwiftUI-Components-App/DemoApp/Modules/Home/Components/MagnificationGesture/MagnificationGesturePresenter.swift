import Foundation
import SwiftUI

final class MagnificationGesturePresenter: ObservableObject {
    
    // MARK: - Properties
    
    private let wireframe: MagnificationGestureWireframeInterface

    // MARK: - Lifecycle

    init(wireframe: MagnificationGestureWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}