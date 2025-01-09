final class FormWireframe: BaseWireframe<LazyHostingViewController<FormView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<FormView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = FormPresenter(wireframe: self)
        moduleViewController.rootView = FormView(presenter: presenter)
    }
}

// MARK: - Extensions

extension FormWireframe: FormWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
