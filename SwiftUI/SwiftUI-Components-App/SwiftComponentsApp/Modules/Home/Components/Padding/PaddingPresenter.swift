import Foundation
import SwiftUI

final class PaddingPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: PaddingWireframeInterface

    // MARK: - Lifecycle

    init(wireframe: PaddingWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
