import Foundation
import SwiftUI

final class ConfirmationDialogPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: ConfirmationDialogWireframeInterface
    
    //ConfirmationDialog properties
    @Published var showDialog = false
    @Published var selectedOption = ""

    // MARK: - Lifecycle

    init(wireframe: ConfirmationDialogWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
