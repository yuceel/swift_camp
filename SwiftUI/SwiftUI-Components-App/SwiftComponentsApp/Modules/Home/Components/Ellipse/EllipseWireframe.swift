final class EllipseWireframe: BaseWireframe<LazyHostingViewController<EllipseView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<EllipseView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = EllipsePresenter(wireframe: self)
        moduleViewController.rootView = EllipseView(presenter: presenter)
    }
}

// MARK: - Extensions

extension EllipseWireframe: EllipseWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
