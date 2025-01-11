import UIKit

final class GridWireframe: BaseWireframe<LazyHostingViewController<GridView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<GridView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = GridPresenter(wireframe: self)
        moduleViewController.rootView = GridView(presenter: presenter)
    }
}

// MARK: - Extensions

extension GridWireframe: GridWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
