
final class AlertWireframe:BaseWireframe<LazyHostingViewController<AlertView>>, AlertWireframeInterface {
    
    
    init() {
        let moduleViewController = LazyHostingViewController<AlertView>(isNavigationBarHidden: true)
        
        super.init(viewController: moduleViewController)
        
        let presenter = AlertPresenter(wireframe: self)
        moduleViewController.rootView = AlertView(presenter: presenter)
    }
}

extension AlertWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
