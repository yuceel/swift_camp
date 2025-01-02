final class TapGestureWireframe: BaseWireframe<LazyHostingViewController<TapGestureView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<TapGestureView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = TapGesturePresenter(wireframe: self)
        moduleViewController.rootView = TapGestureView(presenter: presenter)
    }
}

// MARK: - Extensions

extension TapGestureWireframe: TapGestureWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
