final class PaddingWireframe: BaseWireframe<LazyHostingViewController<PaddingView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<PaddingView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = PaddingPresenter(wireframe: self)
        moduleViewController.rootView = PaddingView(presenter: presenter)
    }
}

// MARK: - Extensions

extension PaddingWireframe: PaddingWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
