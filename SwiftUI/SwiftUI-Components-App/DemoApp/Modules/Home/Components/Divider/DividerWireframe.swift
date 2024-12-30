final class DividerWireframe: BaseWireframe<LazyHostingViewController<DividerView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<DividerView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = DividerPresenter(wireframe: self)
        moduleViewController.rootView = DividerView(presenter: presenter)
    }
}

// MARK: - Extensions

extension DividerWireframe: DividerWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
