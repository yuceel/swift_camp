
import UIKit

final class CircleWireframe: BaseWireframe<LazyHostingViewController<CircleView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<CircleView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = CirclePresenter(wireframe: self)
       moduleViewController.rootView = CircleView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension CircleWireframe: CircleWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}


