import UIKit
import Foundation
import Combine

final class OffsetPresenter: ObservableObject {
    
    private let wireframe: OffsetWireframeInterface
    
    init(wireframe: OffsetWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

