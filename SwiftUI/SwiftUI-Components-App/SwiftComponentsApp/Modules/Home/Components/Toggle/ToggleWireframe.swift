import UIKit

final class ToggleWireframe: BaseWireframe<LazyHostingViewController<ToggleView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<ToggleView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = TogglePresenter(wireframe: self)
        moduleViewController.rootView = ToggleView(presenter: presenter)
    }
}

// MARK: - Extensions

extension ToggleWireframe: ToggleWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
