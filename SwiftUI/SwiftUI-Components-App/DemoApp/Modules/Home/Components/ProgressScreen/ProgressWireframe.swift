final class ProgressWireframe: BaseWireframe<LazyHostingViewController<ProgresView>>, ProgressWireframeInterface {
    
    init() {
        let moduleViewController = LazyHostingViewController<ProgresView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        
        let presenter = ProgressPresenter(wireframe: self)
        moduleViewController.rootView = ProgresView(presenter: presenter)
    }
}

extension ProgressWireframe{
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
