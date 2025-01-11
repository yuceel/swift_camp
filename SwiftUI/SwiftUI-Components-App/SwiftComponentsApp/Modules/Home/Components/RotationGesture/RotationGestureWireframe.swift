import Foundation

final class RotationGestureWireframe: BaseWireframe<LazyHostingViewController<RotationGestureView>>, RotationGestureWireframeInterface{
    
    init() {
        let moduleViewController = LazyHostingViewController<RotationGestureView>(isNavigationBarHidden: true)
        
        super.init(viewController: moduleViewController)
        let presenter = RotationGesturePresenter(wireframe: self)
        moduleViewController.rootView = RotationGestureView(presenter: presenter)
            
            
        
    }
}

extension RotationGestureWireframe{
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
}
