final class ForegroundColorWireframe: BaseWireframe<LazyHostingViewController<ForegroundColorView>>, ForegroundColorWireframeInterface {
    
    init() {
        let moduleViewController = LazyHostingViewController<ForegroundColorView>(isNavigationBarHidden: true)
        
        super.init(viewController: moduleViewController)
        
        let presenter = ForegroundColorPresenter(wireframe: self)
        moduleViewController.rootView = ForegroundColorView(presenter: presenter)
    }
}

extension ForegroundColorWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

