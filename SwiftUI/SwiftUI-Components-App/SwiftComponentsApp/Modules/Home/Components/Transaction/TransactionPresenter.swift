import Foundation
import SwiftUI

final class TransactionPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: TransactionWireframeInterface

    // State properties for animation
    @Published var isExpanded: Bool = false

    // MARK: - Lifecycle

    init(wireframe: TransactionWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }

    // MARK: - Animation Handling

    func toggleExpansion() {
        withTransaction(Transaction(animation: .spring())) {
            isExpanded.toggle()
        }
    }
}
