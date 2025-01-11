final class LazyVGridWireframe: BaseWireframe<LazyHostingViewController<LazyVGridView>>, LazyVGridWireframeInterface {
   
    init() {
        let moduleViewController = LazyHostingViewController<LazyVGridView>(isNavigationBarHidden: true)
        
        super.init(viewController: moduleViewController)
        let presenter = LazyVGridPresenter(wireframe: self)
        moduleViewController.rootView = LazyVGridView(presenter: presenter)
    }
}
extension LazyVGridWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
