import UIKit
import Foundation
import Combine

final class PathPresenter: ObservableObject {
    
    private let wireframe: PathWireframeInterface
    
    init(wireframe: PathWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}


