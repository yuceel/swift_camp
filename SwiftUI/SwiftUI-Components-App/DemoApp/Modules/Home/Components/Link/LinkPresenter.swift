import Combine

final class LinkPresenter: ObservableObject {
    private let wireframe: LinkWireframeInterface

    init(wireframe: LinkWireframeInterface) {
        self.wireframe = wireframe
    }

    /// Navigates back to the previous screen
    func goBack() {
        wireframe.goBack()
    }

    /// Navigates to a new link
    func navigateToNewLink() {
        wireframe.navigateToNewLink()
    }
}
