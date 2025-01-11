import UIKit

final class GroupBoxWireframe: BaseWireframe<LazyHostingViewController<GroupBoxView>> {
    
    
    init() {
        let moduleViewController = LazyHostingViewController<GroupBoxView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        let presenter = GroupBoxPresenter(wireframe: self)
        moduleViewController.rootView = GroupBoxView(presenter: presenter)
    }
}


extension GroupBoxWireframe: GroupBoxWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
