import Foundation
import SwiftUI

final class ScrollViewPresenter: ObservableObject {

    // MARK: - Properties

    private let wireframe: ScrollViewWireframeInterface
    
    //ScrollView properties
    @Published var scrollAxisHorizontal: Axis.Set = .horizontal
    @Published var scrollAxisVertical: Axis.Set = .vertical
    @Published var showsIndicator: Bool = true

    // MARK: - Lifecycle

    init(wireframe: ScrollViewWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Navigation

    func goBack() {
        wireframe.goBack()
    }
}
