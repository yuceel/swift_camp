final class CapsuleWireframe: BaseWireframe<LazyHostingViewController<CapsuleView>>, CapsuleWireframeInterface {
    
    init() {
        let moduleViewController = LazyHostingViewController<CapsuleView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let presenter = CapsulePresenter(wireframe: self)
        moduleViewController.rootView = CapsuleView(presenter: presenter)
    }
}


extension CapsuleWireframe{
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
