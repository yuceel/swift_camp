final class StepperWireframe: BaseWireframe<LazyHostingViewController<StepperView>> {

    // MARK: - Module setup

    init() {
        let moduleViewController = LazyHostingViewController<StepperView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = StepperPresenter(wireframe: self)
        moduleViewController.rootView = StepperView(presenter: presenter)
    }
}

// MARK: - Extensions

extension StepperWireframe: StepperWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

