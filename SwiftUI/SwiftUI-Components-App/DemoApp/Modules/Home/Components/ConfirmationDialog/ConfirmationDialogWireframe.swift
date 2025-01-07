final class ConfirmationDialogWireframe: BaseWireframe<LazyHostingViewController<ConfirmationDialogView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<ConfirmationDialogView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = ConfirmationDialogPresenter(wireframe: self)
        moduleViewController.rootView = ConfirmationDialogView(presenter: presenter)
    }
}

// MARK: - Extensions

extension ConfirmationDialogWireframe: ConfirmationDialogWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

