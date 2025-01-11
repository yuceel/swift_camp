import Combine
import Foundation

final class NavigationPresenter : ObservableObject {
    
    private let wireframe : NavigationWireframeInterface
    
    init (wireframe : NavigationWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
