final class EnvironmentWireframe: BaseWireframe<LazyHostingViewController<EnvironmentView>>, EnvironmentWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<EnvironmentView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = EnvironmentPresenter(wireframe: self)

        moduleViewController.rootView = EnvironmentView(presenter: presenter)
    }
}

extension EnvironmentWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

