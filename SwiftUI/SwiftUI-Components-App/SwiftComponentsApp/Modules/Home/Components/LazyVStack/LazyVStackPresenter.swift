import Foundation
import SwiftUI

final class LazyVStackPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: LazyVStackWireframeInterface

    // MARK: - Lifecycle

    init(wireframe: LazyVStackWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
