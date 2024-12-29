import Foundation
import SwiftUI

final class EllipsePresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: EllipseWireframeInterface
    
    // Ellipse properties
    @Published  var color: Color = .blue
    @Published  var width: CGFloat = 200
    @Published  var height: CGFloat = 100

    // MARK: - Lifecycle

    init(wireframe: EllipseWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}


