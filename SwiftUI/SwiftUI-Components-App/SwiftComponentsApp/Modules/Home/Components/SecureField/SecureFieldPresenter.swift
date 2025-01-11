import Foundation
import SwiftUI

final class SecureFieldPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: SecureFieldWireframeInterface
    
    //SecureField properties
    @Published var password: String = ""

    // MARK: - Lifecycle

    init(wireframe: SecureFieldWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
