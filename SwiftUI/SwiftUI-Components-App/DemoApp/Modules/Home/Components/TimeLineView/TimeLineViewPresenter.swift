import UIKit
import Foundation
import Combine

final class TimeLineViewPresenter: ObservableObject {
    
    private let wireframe: TimeLineViewWireframeInterface
    
    init(wireframe: TimeLineViewWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

