final class LabelWireframe: BaseWireframe<LazyHostingViewController<LabelView>>, LabelWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<LabelView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = LabelPresenter(wireframe: self)

        moduleViewController.rootView = LabelView(presenter: presenter)
    }
}

extension LabelWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

