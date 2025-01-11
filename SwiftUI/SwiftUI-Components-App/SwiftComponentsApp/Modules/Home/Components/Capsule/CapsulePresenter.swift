import Foundation

final class CapsulePresenter: ObservableObject {
    private let wireframe: CapsuleWireframeInterface
    
    init (wireframe: CapsuleWireframeInterface){
        self.wireframe = wireframe
    }
    
    func goBack(){
        wireframe.goBack()
    }
    
}
