import Foundation

final class CornerRadiusWireframe: BaseWireframe<LazyHostingViewController<CornerRadiusView>>, CornerRadiusWireframeInterface {
    
    init() {
        let moduleViewController = LazyHostingViewController<CornerRadiusView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let presenter = CornerRadiusPresenter(wireframe: self)
        moduleViewController.rootView = CornerRadiusView(presenter: presenter)
        
    }
}

extension CornerRadiusWireframe{
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
