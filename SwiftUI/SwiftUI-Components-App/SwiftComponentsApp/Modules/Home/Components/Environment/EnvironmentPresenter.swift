import UIKit
import Foundation
import Combine

final class EnvironmentPresenter: ObservableObject {
    
    private let wireframe: EnvironmentWireframeInterface
    
    init(wireframe: EnvironmentWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

