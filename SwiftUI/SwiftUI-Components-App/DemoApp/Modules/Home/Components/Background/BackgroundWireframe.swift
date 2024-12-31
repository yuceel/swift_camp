final class BackgroundWireframe: BaseWireframe<LazyHostingViewController<BackgroundView>>, BackgroundWireframeInterface {
    
    init() {
        let moduleViewController = LazyHostingViewController<BackgroundView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let presenter = BackgroundPresenter(wireframe: self)
        moduleViewController.rootView = BackgroundView(presenter: presenter)
    }
}

extension BackgroundWireframe{
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
}
