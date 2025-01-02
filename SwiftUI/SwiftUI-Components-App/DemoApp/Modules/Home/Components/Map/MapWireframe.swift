import UIKit

final class MapWireframe: BaseWireframe<LazyHostingViewController<MapView>>, MapWireframeInterface {

    // MARK: - Module setup -

    init() {
        let moduleViewController = LazyHostingViewController<MapView>(isNavigationBarHidden: true)

        super.init(viewController: moduleViewController)

        let presenter = MapPresenter(wireframe: self)
        
        

        moduleViewController.rootView = MapView(presenter: presenter)
    }

}

// MARK: - Extensions -

extension MapWireframe {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
