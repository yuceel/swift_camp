import UIKit

final class SectionWireframe: BaseWireframe<LazyHostingViewController<SectionView>> {
    
    // MARK: - Module setup
    init() {
        let moduleViewController = LazyHostingViewController<SectionView>(isNavigationBarHidden: true)
        super.init(viewController: moduleViewController)
        
        let interactor = SectionInteractor()
        let presenter = SectionPresenter(wireframe: self, interactor: interactor)
        moduleViewController.rootView = SectionView(presenter: presenter)
    }
}

// MARK: - Extensions
extension SectionWireframe: SectionWireframeInterface {
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
