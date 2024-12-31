import Foundation
import SwiftUI

final class PickerPresenter: ObservableObject {
    
    // MARK: - Properties
    
    private let wireframe: PickerWireframeInterface
    
    // MARK: - Lifecycle
    
    init(wireframe: PickerWireframeInterface) {
        self.wireframe = wireframe
    }
    
    // MARK: - Navigation
    
    func goBack() {
        wireframe.goBack()
    }
}