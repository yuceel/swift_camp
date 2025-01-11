final class PopoverWireframe:BaseWireframe<LazyHostingViewController<PopoverView>> {
    
    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<PopoverView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)

        let presenter = PopoverPresenter(wireframe: self)
        moduleViewController.rootView = PopoverView(presenter: presenter)
        }
}

// MARK: - Extensions -

extension PopoverWireframe:PopoverWireframeInterface{
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

