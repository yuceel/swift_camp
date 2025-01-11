import Combine
import Foundation

final class LongPressGesturePresenter : ObservableObject {
    
    private let wireframe : LongPressGestureWireframeInterface
    
    init (wireframe : LongPressGestureWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
