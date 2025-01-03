import Foundation

final class RotationGesturePresenter: ObservableObject{
    private let wireframe: RotationGestureWireframeInterface
    init(wireframe: RotationGestureWireframeInterface){
        self.wireframe = wireframe
    }
    
    func goBack(){
        wireframe.goBack()
    }
    
}
