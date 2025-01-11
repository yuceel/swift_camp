import Foundation
import Combine

final class MagnificationGesturePresenter: ObservableObject {
    private let wireframe: MagnificationGestureWireframeInterface
    @Published var scale: CGFloat = 1.0
    
    init(wireframe: MagnificationGestureWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
    
    func onMagnificationChanged(_ value: CGFloat) {
        scale = value
    }
    
    func onMagnificationEnded() {
        scale = 1.0
    }
}
