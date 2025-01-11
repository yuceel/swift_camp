final class ActionSheetWireframe: BaseWireframe<LazyHostingViewController<ActionSheetView>>, ActionSheetWireframeInterface {
    
    // MARK: - Initialization -
    init() {
        let moduleViewController = LazyHostingViewController<ActionSheetView>(isNavigationBarHidden: true)
        
        super.init(viewController: moduleViewController)
        
        let presenter = ActionSheetPresenter(wireframe: self)
        moduleViewController.rootView = ActionSheetView(presenter: presenter)
    }
}

// MARK: - Navigation -
extension ActionSheetWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

