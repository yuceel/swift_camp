final class ContextMenuWireframe: BaseWireframe<LazyHostingViewController<ContextMenuView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<ContextMenuView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = ContextMenuPresenter(wireframe: self)
        moduleViewController.rootView = ContextMenuView(presenter: presenter)
    }
}

// MARK: - Extensions

extension ContextMenuWireframe: ContextMenuWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
