import Combine
import Foundation

final class DatePickerPresenter : ObservableObject {
    
    private let wireframe : DatePickerWireframeInterface
    
    init (wireframe : DatePickerWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
