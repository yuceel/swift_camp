import Foundation
import SwiftUI

final class TapGesturePresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: TapGestureWireframeInterface
    
    //TapGesture properties
    @Published var singleTapMessage = "Single Tap Me!"
    @Published var doubleTapMessage = "Double Tap Me!"
    @Published var boxColor = Color.blue

    // MARK: - Lifecycle

    init(wireframe: TapGestureWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
