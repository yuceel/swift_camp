

final class PathWireframe: BaseWireframe<LazyHostingViewController<PathView>>, PathWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<PathView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = PathPresenter(wireframe: self)

        moduleViewController.rootView = PathView(presenter: presenter)
    }
}

extension PathWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

