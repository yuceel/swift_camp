import Foundation

final class GeometryReaderWireframe: BaseWireframe<LazyHostingViewController<GeometryReaderView>>, GeometryReaderWireframeInterface {
    
    init() {
        let moduleViewController = LazyHostingViewController<GeometryReaderView>(isNavigationBarHidden: true)
        
        super.init(viewController: moduleViewController)
        let presenter = GeometryReaderPresenter(wireframe: self)
        moduleViewController.rootView = GeometryReaderView(presenter: presenter)
    }
}

extension GeometryReaderWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
