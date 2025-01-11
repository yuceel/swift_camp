import UIKit

final class GridRowWireframe: BaseWireframe<LazyHostingViewController<GridRowView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<GridRowView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = GridRowPresenter(wireframe: self)
       moduleViewController.rootView = GridRowView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension GridRowWireframe: GridRowWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}

