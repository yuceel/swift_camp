
import UIKit

final class GroupWireframe: BaseWireframe<LazyHostingViewController<GroupView>> {
   
   // MARK: - Module setup -
   init() {
       let moduleViewController = LazyHostingViewController<GroupView>(isNavigationBarHidden: true)
       super.init(viewController: moduleViewController)

       let presenter = GroupPresenter(wireframe: self)
       moduleViewController.rootView = GroupView(presenter: presenter)
   }
}

// MARK: - Extensions -

extension GroupWireframe: GroupWireframeInterface {
   func goBack() {
       navigationController?.popViewController(animated: true)
   }
}


