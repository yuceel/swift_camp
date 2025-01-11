final class SliderWireframe: BaseWireframe<LazyHostingViewController<SliderView>>, SliderWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<SliderView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = SliderPresenter(wireframe: self)

        moduleViewController.rootView = SliderView(presenter: presenter)
    }
}

extension SliderWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

