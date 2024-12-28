final class LazyVStackWireframe: BaseWireframe<LazyHostingViewController<LazyVStackView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<LazyVStackView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = LazyVStackPresenter(wireframe: self)
        moduleViewController.rootView = LazyVStackView(presenter: presenter)
    }
}

// MARK: - Extensions

extension LazyVStackWireframe: LazyVStackWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
