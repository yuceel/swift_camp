import Foundation
import SwiftUI

final class DividerPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: DividerWireframeInterface

    // MARK: - Lifecycle

    init(wireframe: DividerWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
