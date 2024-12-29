final class ScrollViewWireframe: BaseWireframe<LazyHostingViewController<CustomScrollView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<CustomScrollView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = ScrollViewPresenter(wireframe: self)
        moduleViewController.rootView = CustomScrollView(presenter: presenter)
    }
}

// MARK: - Extensions

extension ScrollViewWireframe: ScrollViewWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
