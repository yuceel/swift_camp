import Foundation

final class LazyVGridPresenter:ObservableObject {
    
    private let wireframe: LazyVGridWireframeInterface
    
    init(wireframe: LazyVGridWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack(){
        wireframe.goBack()
    }

}
