
final class TimeLineViewWireframe: BaseWireframe<LazyHostingViewController<TimeLineView>>, TimeLineViewWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<TimeLineView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = TimeLineViewPresenter(wireframe: self)

        moduleViewController.rootView = TimeLineView(presenter: presenter)
    }
}

extension TimeLineViewWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
