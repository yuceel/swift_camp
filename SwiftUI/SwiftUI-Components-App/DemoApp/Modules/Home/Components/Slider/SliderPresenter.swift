import UIKit
import Foundation
import Combine

final class SliderPresenter: ObservableObject {
    
    private let wireframe: SliderWireframeInterface
    
    init(wireframe: SliderWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}




