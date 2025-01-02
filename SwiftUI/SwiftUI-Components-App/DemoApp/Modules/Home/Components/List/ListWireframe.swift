
import UIKit

final class ListWireframe: BaseWireframe<LazyHostingViewController<ListView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<ListView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = ListPresenter(wireframe: self)
       moduleViewController.rootView = ListView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension ListWireframe: ListWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}


