final class SecureFieldWireframe: BaseWireframe<LazyHostingViewController<SecureFieldView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<SecureFieldView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = SecureFieldPresenter(wireframe: self)
        moduleViewController.rootView = SecureFieldView(presenter: presenter)
    }
}

// MARK: - Extensions

extension SecureFieldWireframe: SecureFieldWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
