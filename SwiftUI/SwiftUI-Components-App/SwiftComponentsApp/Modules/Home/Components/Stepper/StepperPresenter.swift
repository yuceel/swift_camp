import Foundation
import SwiftUI

final class StepperPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: StepperWireframeInterface
    
    //Stepper properties
    @Published var quantity: Int = 0

    // MARK: - Lifecycle

    init(wireframe: StepperWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
