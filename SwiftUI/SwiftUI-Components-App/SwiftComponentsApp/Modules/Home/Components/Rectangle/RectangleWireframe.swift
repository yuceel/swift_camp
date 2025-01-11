import UIKit

final class RectangleWireframe: BaseWireframe<LazyHostingViewController<RectangleView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<RectangleView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = RectanglePresenter(wireframe: self)
        moduleViewController.rootView = RectangleView(presenter: presenter)
    }
}

// MARK: - Extensions

extension RectangleWireframe: RectangleWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
