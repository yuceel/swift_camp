import Foundation
import SwiftUI

final class PopoverPresenter: ObservableObject {
    
    // MARK: - Properties
    
    private let wireframe: PopoverWireframeInterface

    // MARK: - Lifecycle

    init(wireframe: PopoverWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}