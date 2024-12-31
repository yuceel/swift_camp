import Foundation

final class ProgressPresenter: ObservableObject {
    private let wireframe: ProgressWireframeInterface
    
    init(wireframe: ProgressWireframeInterface){
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
