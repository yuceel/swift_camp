
import Combine
import Foundation

final class SegmentedControlPresenter : ObservableObject {
    
    private let wireframe : SegmentedControlWireframeInterface
    
    init (wireframe : SegmentedControlWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
