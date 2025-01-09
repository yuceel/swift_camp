final class AnyViewWireframe: BaseWireframe<LazyHostingViewController<CustomAnyView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<CustomAnyView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = AnyViewPresenter(wireframe: self)
        moduleViewController.rootView = CustomAnyView(presenter: presenter)
    }
}

// MARK: - Extensions

extension AnyViewWireframe: AnyViewWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

