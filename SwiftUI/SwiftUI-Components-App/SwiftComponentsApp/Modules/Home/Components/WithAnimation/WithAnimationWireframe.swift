final class WithAnimationWireframe: BaseWireframe<LazyHostingViewController<WithAnimationView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<WithAnimationView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = WithAnimationPresenter(wireframe: self)
        moduleViewController.rootView = WithAnimationView(presenter: presenter)
    }
}

// MARK: - Extensions

extension WithAnimationWireframe: WithAnimationWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
