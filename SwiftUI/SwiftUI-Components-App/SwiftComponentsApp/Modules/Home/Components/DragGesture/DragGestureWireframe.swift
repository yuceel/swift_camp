import UIKit

final class DragGestureWireframe: BaseWireframe<LazyHostingViewController<DragGestureView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<DragGestureView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = DragGesturePresenter(wireframe: self)
       moduleViewController.rootView = DragGestureView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension DragGestureWireframe: DragGestureWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}

