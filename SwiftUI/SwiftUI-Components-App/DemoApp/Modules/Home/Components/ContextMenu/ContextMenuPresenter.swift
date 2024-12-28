import Foundation
import SwiftUI

final class ContextMenuPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: ContextMenuWireframeInterface
    
    //ContextMenu properties
    @Published var selectedAction: String = ""

    // MARK: - Lifecycle

    init(wireframe: ContextMenuWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
