import Foundation
import SwiftUI

final class AnyViewPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: AnyViewWireframeInterface
    
    //AnyView properties
    @Published var currentViewIndex = 0

    // MARK: - Lifecycle

    init(wireframe: AnyViewWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}

