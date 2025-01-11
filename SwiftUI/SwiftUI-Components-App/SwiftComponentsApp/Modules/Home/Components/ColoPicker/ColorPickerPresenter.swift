import Foundation
import SwiftUI

final class ColorPickerPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: ColorPickerWireframeInterface

    // Binding property for selected color
    @Published var selectedColor: Color = .blue

    // MARK: - Lifecycle

    init(wireframe: ColorPickerWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
